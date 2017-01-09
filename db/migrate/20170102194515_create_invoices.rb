class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|

      t.belongs_to :service, index: true

      t.integer :hours
      t.text    :description
      t.float   :subtotal
      t.float   :total
      
      t.date    :due_date

      t.timestamps
    end
  end
end
