class StudentHomeworks
  attr_reader :student

  def initialize(student_name)
    if valid_student?(student_name)
      puts "Found #{@student.name}."
    else
      raise StudentNotFoundError
    end
  end

  def call
    show_homeworks
  end

  def valid_student?(student_name)
    @student = Student.find_by(:name => student_name)
    !@student.nil?
  end

  def show_homeworks
    
  end
end

class StudentNotFoundError < Exception
end