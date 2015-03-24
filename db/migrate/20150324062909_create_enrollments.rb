class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :talk_concert, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :enrollments, :talk_concerts
    add_foreign_key :enrollments, :users
    add_index :enrollments, [:talk_concert_id, :user_id], unique: true
  end
end
