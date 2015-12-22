class BatchSubjectsController < ApplicationController
  before_action :confirm_logged_in
  def index
  	if(params[:assignt]=='1')
  		@dept = Department.find_by(:code => session[:username])
  		sem=(params[:year].to_i)*2 - 1
  		@subjects=Subject.where(:department_id => @dept.id , :semester => sem)
  	end
  end

  def yearindex
  end

  def show
  	@bs= BatchSubject.find(params[:id])
  	@subject = Subject.find_by_id(@bs.subject_id)
  	@batch = Batch.find_by_id(@bs.batch_id)

  	@teachers= @subject.teachers 
  	if(@bs.teacher_id)
  		@teacher = Teacher.find(@bs.teacher_id)
  	end
  end

  def update
  	puts params.inspect
  	@teacher=Teacher.find(params[:teacher_id])
  	bs = BatchSubject.find(params[:id])
  	@teacher.batch_subjects << bs
  	flash[:notice] = "Teacher assigned succesfully."
    redirect_to(:controller => 'batch_subjects' , :action => 'show',:assigns => 1)	
  end
end
