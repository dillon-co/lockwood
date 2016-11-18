# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  admin_id   :integer
#  video      :string
#  title      :string           not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'ots'
require 'nokogiri'
require 'open-uri'


class Blog < ApplicationRecord
  belongs_to :admin
  has_many :tags

  after_create :create_summary


  has_attached_file :photo, , styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :photo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }



  def embed_video(youtube_url)
    youtube_url.split("=").last
  end

  def video_link
    youtube_id = embed_video(video)
    "//www.youtube.com/embed/#{youtube_id}"
  end  

  def create_summary
    full_text = OTS.parse(non_html_body)
    ots_parsed_summary = full_text.summarize(sentences: 3)
    blog_summary = ots_parsed_summary.map { |h| h[:sentence] }.join("")
    self.update(summary: blog_summary)
  end  

  def non_html_body
    text_with_newlines = Nokogiri::HTML(body).content
    text_without_newlines = text_with_newlines.gsub(/\r?\n|\r/, "")
    text_without_newlines
  end  
end
