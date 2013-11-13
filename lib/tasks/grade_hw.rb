class GradeHomeworks
  def initialize()
    @assignments = Assignment.where(spec_present: true)
  end

  def call
    @assignments.each do |assignment|
      puts "Grading #{assignment.name} ..."
      Homework.evaluate_all(assignment)
      sleep(90)
    end
  end
end