class CreateBillingItems < ActiveRecord::Migration[5.0]
  def change
    create_table :billing_items do |t|

      t.belongs_to :service, index: true

      t.string :description
      t.integer :hours
      t.float   :amount

      t.timestamps
    end
  end
end
