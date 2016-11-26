# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  blog_id    :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  belongs_to :blog
end
