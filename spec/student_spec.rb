require 'student'
require 'exam'
require 'feedback'

describe Student do
  subject(:student) { Student.new }

  let(:feedback1) { double :Feedback }

  let(:exam1) { double :Exam }
  let(:exam2) { double :Exam }

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
      allow(feedback1).to receive(:happiness).and_return(4)

      student = Student.new(feedbacks: [feedback1, feedback1])

      expect(student.happiness).to eq 4
    end

    it 'defaults to zero' do
      expect(student.happiness).to eq 0
    end
  end

  describe '#exam_scores' do
    it 'returns all exam scores' do
      allow(exam1).to receive(:pretty_date_taken).and_return(Date.today.to_s)
      allow(exam1).to receive(:score).and_return(1)

      allow(exam2).to receive(:pretty_date_taken).and_return(Date.today.to_s)
      allow(exam2).to receive(:score).and_return(1)

      student = Student.new(exams: [exam1, exam2])

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
