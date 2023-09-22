class Student < ApplicationRecord
	has_many :student_projects
	has_many :projects, through: :student_projects
end
