class Course < ApplicationRecord
    validates :name, presence: true, length: { minimum: 5, maximum: 20}
    validates :code, presence: true, length: { minimum: 3, maximum: 6}
    validates :description, presence: true, length: { minimum: 10, maximum: 300}

    has_many :student_courses
    has_many :students, through: :student_courses 
end