class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string  :address
      t.integer :visitor_id

      t.timestamps null: false
    end
  end
end
