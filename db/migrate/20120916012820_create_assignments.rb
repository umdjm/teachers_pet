class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :course_id
      t.string :name
      t.float :total_points

      t.timestamps
    end
  end
end
