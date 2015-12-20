class TimeslotsController < ApplicationController
	before_action :confirm_logged_in
  def index
  	@timeslots = Timeslot.all
    @filtered_timeslots = []
    if params[:subject_id] && params[:batches]
      @filtered_timeslots = @timeslots
      params[:batches].each do |batch_id|
        if !((defined?(var)).nil?)
        @filtered_timeslots = @filtered_timeslots - Batch.find(batch_id).timeslots
        end
      end
      bs=BatchSubject.where("subject_id = ?",params[:subject_id]).find_by_batch_id(params[:batches][0])
      tid= bs.teacher_id
      @filtered_timeslots = @filtered_timeslots - Teacher.find(tid).timeslots


    end

  	# @monday = @timeslots.where("day = '0'") 
  	# @tuesday = @timeslots.where("day = '1'") 
  	# @wednesday = @timeslots.where("day = '2'") 
  	# @thursday = @timeslots.where("day = '3'") 
  	# @friday = @timeslots.where("day = '4'") 
  	# @saturday = @timeslots.where("day = '5'") 
  	year1 = params[:year].to_i
  	puts year1
    sem= (2*year1)-1
  	@batches = Batch.all.where("year = ?", year1)
    deptid=Department.find_by_code(session[:username]).id;
    @subjects = Subject.all.where("department_id = ?", deptid).where("semester = ?",sem)

  end

  def returnbatches
    subject=Subject.find(params[:subid])
    @batches=subject.batches
    render :json => @batches
  end

    def returnrembatches
      teacherid= BatchSubject.where("batch_id = ?",params[:batchid]).find_by_subject_id(params[:subid]).teacher_id
    @bs=BatchSubject.where("subject_id = ?",params[:subid]).where("teacher_id = ? ",teacherid)
    @batches = []
    @bs.each do |b| 
      @batches << (Batch.find(b.batch_id))
    end
    render :json => @batches
  end

    def returnbatches
      @rooms = []
      allrooms = Room.all.where("type='lec'")
      allrooms.each do |r|
        if !(r.timeslots.map(&:id).include?(params[:slotid]))
          @rooms << r
        end
      end
    render :json => @rooms
  end


  def update
  end
end
