class Course < ApplicationRecord
  belongs_to :professor, optional: true
  belongs_to :student,optional: true
  validates :name, presence: true
  validates :category, presence: true

  validates :name, presence: true, length: { minimum: 1 }
end
