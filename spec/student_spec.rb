require 'student'
require 'exam'
require 'feedback'

describe Student do
  subject(:student) { Student.new }

  describe '#full_name' do
    it 'returns the student first name and last name' do
      student = Student.new(first_name: "Sian", last_name: "McAvoy")

      expect(student.full_name).to eq "Sian McAvoy"
    end

    it 'defaults to "Joe Bloggs"' do
      expect(student.full_name).to eq "Joe Bloggs"
    end
  end

  describe '#happiness' do
    it 'returns the average happiness reported' do
      feedback_1 = Feedback.new(4, Date.today)
      feedback_2 = Feedback.new(4, Date.today)
      student = Student.new(feedbacks: [feedback_1, feedback_2])

      expect(student.happiness).to eq 4
    end

    it 'defaults to zero' do
      expect(student.happiness).to eq 0
    end
  end

  describe '#exam_scores' do
    it 'returns all exam scores' do
      exam_1 = Exam.new(Date.today, [Answer.new(5, 5)])
      exam_2 = Exam.new(Date.today, [Answer.new(6, 6)])
      student = Student.new(exams: [exam_1, exam_2])

      expect(student.exam_scores).to eq({ "#{ Date.today.to_s }" => [1, 1] })
    end

    it 'defaults to being empty' do
      expect(student.exam_scores).to be_empty
    end
  end

  describe '#attendance' do
    it 'describes the student attendance' do
    end
  end
end
