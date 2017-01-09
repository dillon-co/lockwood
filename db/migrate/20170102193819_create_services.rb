class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|

      t.belongs_to :client, index: true

      t.string :title

      t.text  :descriotion

      t.float :hourly_rate, default: 300.00

      t.timestamps
    end
  end
end
