class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email

  belongs_to :course
end
