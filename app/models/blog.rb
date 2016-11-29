# == Schema Information
#
# Table name: blogs
#
#  id                 :integer          not null, primary key
#  admin_id           :integer
#  video              :string
#  title              :string           not null
#  body               :text             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  summary            :string
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  small_summary      :string
#  video_image_url    :string
#

=begin
 
 TODO: 

    1 Add photo upload to blog
      a. add s3
      b. blog sample images
    2 Products
      a. endorcements
      b. wholesale option
    3 Link SocialMedia
      a. youtube
        i. seperate model?
      b. instagram 
      c. google plus
      e. twitter
      f. facebook


  Talk to Chris about:

    1 Store 
      a. How people buye
      b. how invioces made?
    2 Blog Material
      a. material written?
      b. accompanying video?
    3. Elias and Videos
    4. Adding photo's from flickr or uploading them manually

=end


require 'ots'
require 'nokogiri'
require 'open-uri'


class Blog < ApplicationRecord
  belongs_to :admin
  has_many :tags

  after_create :create_both_summaries
  after_create :get_video_thumbnail


  has_attached_file :photo, styles: { small: "64x64",
                                      med: "100x100",
                                      large: "200x200",
                                      thumb: '370x230',
                                      promo: "770x385",
                                      secondary_promo: "370x185",
                                      blog_index: '850x'
                                      }

  validates_attachment :photo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  def video_link
    youtube_id = embed_video(video)
    "//www.youtube.com/embed/#{youtube_id}"
  end  

  def embed_video(youtube_url)
    youtube_url.split("=").last
  end

  def create_small_summary
    create_summary(2)
  end  

  def create_big_summary
    create_summary(3)
  end  

  def create_both_summaries
    self.update(summary: create_big_summary, small_summary: create_small_summary)
  end  

  def create_summary(sentence_count)
    full_text = OTS.parse(non_html_body)
    ots_parsed_summary = full_text.summarize(sentences: sentence_count)
    blog_summary = ots_parsed_summary.map { |h| h[:sentence] }.join("")
    blog_summary
  end  

  def non_html_body
    text_with_newlines = Nokogiri::HTML(body).content
    text_without_newlines = text_with_newlines.gsub(/\r?\n|\r/, "")
    text_without_newlines
  end  

  def get_video_thumbnail
    doc = Nokogiri::HTML(open(video))
    thumbnail_url = doc.at('/html/head/meta[@property="og:image"]')['content']
    self.update(video_image_url: thumbnail_url)
  end  
end
