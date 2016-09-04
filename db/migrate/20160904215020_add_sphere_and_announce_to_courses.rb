class AddSphereAndAnnounceToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :sphere, :string
    add_column :courses, :announce, :string
  end
end
