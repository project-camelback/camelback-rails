class GradeHomeworks
  def initialize()
    @assignments = Assignment.all
  end

  def call
    @assignments.each do |assignment|
      puts "Grading #{assignment.name} ..."
      Homework.evaluate_all(assignment)
    end
  end
end