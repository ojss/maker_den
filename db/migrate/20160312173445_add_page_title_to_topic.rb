class AddPageTitleToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :pageTitle, :string
  end
end
