# == Schema Information
#
# Table name: site_styles
#
#  id                 :integer          not null, primary key
#  style_type         :integer
#  style_color        :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

require 'test_helper'

class SiteStyleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
