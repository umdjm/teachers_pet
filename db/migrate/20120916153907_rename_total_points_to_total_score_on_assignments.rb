class RenameTotalPointsToTotalScoreOnAssignments < ActiveRecord::Migration
  def change
    rename_column :assignments, :total_points, :total_score
  end
end
