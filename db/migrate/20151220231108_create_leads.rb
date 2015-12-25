class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :description
      t.integer :inquiry_id
      t.string :address
      t.string :recepient_type

      t.timestamps null: false
    end
  end
end
