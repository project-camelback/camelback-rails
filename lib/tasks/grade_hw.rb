class GradeHomeworks
  def initialize()
    # @assignments = Assignment.where(spec_present: true)
    @assignment = Assignment.find(9)
  end

  def call
    # @assignments.each do |assignment|
    #   puts "Grading #{assignment.name} ..."
    #   Homework.evaluate_all(assignment)
    # end
    Homework.evaluate_all(@assignment)
  end
end