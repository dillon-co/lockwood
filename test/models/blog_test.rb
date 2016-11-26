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

require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
