class CreateTalkConcerts < ActiveRecord::Migration
  def change
    create_table :talk_concerts do |t|
      t.references :user, index: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.integer :people_limit
      t.text :content
      t.datetime :enroll_start_time
      t.datetime :enroll_end_time

      t.timestamps null: false
    end
    add_foreign_key :talk_concerts, :users
  end
end
