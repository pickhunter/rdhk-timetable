class SubjectsController < ApplicationController
  def index
  	    @dept_name = session[:username]
    @dept = Department.find_by(:code => @dept_name)
    @subjects = @dept.subjects
  end
end
