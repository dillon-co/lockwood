# == Schema Information
#  
# Table name: products
#  
#  id              :integer          not null, primary key
#  client_id       :integer
#  user_email      :string
#  user_name       :string
#  name            :string
#  description     :text
#  product_nubmber :integer
#  price           :float
#  total_hours     :float
#  subscription    :boolean
#  paid            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  

class Product < ApplicationRecord
  belongs_to :client
  
end
