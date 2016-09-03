class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :skill
    end
  end
end
