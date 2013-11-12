class GradeHomeworks
  def initialize(assignment = Assignment.find(16))
    @assignment = assignment
  end

  def call
    puts "Grading #{@assignment.name} ..."
    Homework.evaluate_all(@assignment)
  end
end