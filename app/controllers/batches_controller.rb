class BatchesController < ApplicationController
  def index
  	@batches = Batch.all
  end

  def showbatchtt
  	@timeslots = Timeslot.all
    @filtered_timeslots=Batch.find(params[:id]).slots
    @bid=params[:id].to_i
    @sub
    @teacher
    @room
  end
end
