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

class SiteStyle < ApplicationRecord

  has_attached_file :photo, styles: { 
                                      nav: "20x20",    
                                      small: "75x75",
                                      med: "100x100",
                                      large: "200x200",
                                      thumb: '370x230',
                                      promo: "770x385",
                                      secondary_promo: "370x185",
                                      blog_index: '850x425'
                                    }

  validates_attachment_content_type :photo, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  enum style_type: {
    background_photo_1: 1,
    background_photo_2: 2,
    background_photo_3: 3,
    background_photo_4: 4,
    logo_photo:         5
  }

end
