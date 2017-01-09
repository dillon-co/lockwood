class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      
      t.belongs_to :client, index: true

      t.string  :user_email
      t.string  :user_name
      t.string  :name
      
      t.text    :description
      t.integer :product_nubmber 

      t.float   :price
      t.float   :total_hours

      t.boolean :subscription
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
