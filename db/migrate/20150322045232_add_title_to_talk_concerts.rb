class AddTitleToTalkConcerts < ActiveRecord::Migration
  def change
    add_column :talk_concerts, :title, :string
  end
end
