class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :answers

  def exam_state(exam_id)
    Answer.where(user: self).where(exam: Exam.find(exam_id)).count > 0
  end

  def answer_checked(exam_id, option_id)
    answers = Answer.where(user: self).where(exam: Exam.find(exam_id)).first
    arr = answers.answers.split(", ")    
    
    arr.include? option_id.to_s
  end
end
