class Student
  def initialize(first_name: "Joe", last_name: "Bloggs", feedbacks: [], exams: [])
    @first_name = first_name
    @last_name  = last_name
    @feedbacks  = feedbacks
    @exams      = exams
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def happiness
    return 0 if @feedbacks.empty?
    average_feedbacks
  end

  def exam_scores
    @exams
      .group_by(&:pretty_date_taken)
      .map {|date, exams| [date, exams.map(&:score)] }
      .to_h
  end

  private

  def average_feedbacks
    @feedbacks.map(&:happiness).reduce(&:+).to_f / @feedbacks.count
  end
end
