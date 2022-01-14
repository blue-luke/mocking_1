require 'exam'
# require 'answer'

describe Exam do
  let(:answer1) { double :answer}

  let(:answers) do

  allow(answer1).to receive(:correct?).and_return(true)

    [
      answer1,
      answer1,
      answer1
    ]
  end

  subject(:exam) { Exam.new(Date.today, answers) }

  describe '#pretty_date_taken' do
    it 'returns the date the exam was taken, as a string' do
      expect(exam.pretty_date_taken).to eq Date.today.to_s
    end
  end

  describe '#score' do
    it 'returns the number of correct answers' do
      expect(exam.score).to eq 3
    end
  end
end
