class GradeHomeworks
  def initialize()
    @assignments = Assignment.find_by(spec_present: true)
  end

  def call
    @assignments.each do |assignment|
      puts "Grading #{assignment.name} ..."
      Homework.evaluate_all(assignment)
    end
  end
end