class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills, id: false do |t|
      t.integer :user_id
      t.integer :tag_id
    end
  end
end
