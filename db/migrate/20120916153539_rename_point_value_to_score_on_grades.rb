class RenamePointValueToScoreOnGrades < ActiveRecord::Migration
  def change
    rename_column :grades, :point_value, :score
  end
end
