class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
    	t.integer :assignment_id
    	t.integer :student_id
    	t.float :point_value

      t.timestamps
    end
  end
end
