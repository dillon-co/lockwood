class CreateEmailSignups < ActiveRecord::Migration[5.0]
  def change
    create_table :email_signups do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
