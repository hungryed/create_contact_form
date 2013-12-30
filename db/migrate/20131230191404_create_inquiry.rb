class CreateInquiry < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :subject, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
