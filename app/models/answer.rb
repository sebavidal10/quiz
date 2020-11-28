class Answer < ApplicationRecord
  belongs_to :exam
  belongs_to :user
end
