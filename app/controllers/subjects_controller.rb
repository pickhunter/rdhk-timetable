
class SubjectsController < ApplicationController
	before_action :confirm_logged_in
  def index
  	    @dept_name = session[:username]
    @dept = Department.find_by(:code => @dept_name)
    
    if(params[:teacher_id])
    	
    	@teacher = Teacher.find(params[:teacher_id])
    	@subjects = @teacher.subjects
    	@notsubjects = @dept.subjects - @subjects
    else
    @subjects = @dept.subjects
	end

  end


  def update
  	puts params.inspect
  	@teacher=Teacher.find(params[:teacher_id])
  	@subject=Subject.find(params[:id])
  	@teacher.subjects << @subject
  	flash[:notice] = "#{@subject.name.capitalize} added successfully."
  	 redirect_to(teacher_subjects_path(params[:teacher_id],:assigns => 1))
  end

    def destroy
  	puts params.inspect
  	@teacher=Teacher.find(params[:teacher_id])
  	@subject=Subject.find(params[:id])
  	@teacher.subjects.delete(@subject)
  	flash[:notice] = "#{@subject.name.capitalize} unassigned successfully."
  	 redirect_to(teacher_subjects_path(params[:teacher_id],:assigns => 1))
  end
end
