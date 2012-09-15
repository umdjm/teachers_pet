class Student < ActiveRecord::Base
  attr_accessible :name, :email

  belongs_to :course
end
