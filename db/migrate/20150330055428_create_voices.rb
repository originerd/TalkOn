class CreateVoices < ActiveRecord::Migration
  def change
    create_table :voices do |t|
      t.references :talk_concert, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :voices, :talk_concerts
    add_foreign_key :voices, :users
  end
end
