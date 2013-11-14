class HomeworksController < ApplicationController
  def rspec
    homework = Homework.where("assignment_id = ? AND student_id = ?", params[:assignment_id], params[:student_id]).first
    homework.evaluate
    redirect_to controller: 'assignments', action: 'index'
  end
end
