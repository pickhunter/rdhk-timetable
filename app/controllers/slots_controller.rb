class SlotsController < ApplicationController
  # before_action :set_slot, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in

  # GET /slots
  # GET /slots.json
  def index
    @slots = Slot.all
  end

  # GET /slots/1
  # GET /slots/1.json
  def show
  end

  # GET /slots/new
  def new
    @slot = Slot.new
  end

  # GET /slots/1/edit
  def edit
  end

  # POST /slots
  # POST /slots.json
  def create
    # @slot = Slot.new(slot_params)

    # respond_to do |format|
    #   if @slot.save
    #     format.html { redirect_to @slot, notice: 'Slot was successfully created.' }
    #     format.json { render :show, status: :created, location: @slot }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @slot.errors, status: :unprocessable_entity }
    #   end
    # end
    # create a slot
    binding.pry
    tid=BatchSubject.where("batch_id=?",params[:batches][0]).find_by_subject_id(params[:subject_id]).teacher_id
    params[:batches].each do |batchid|
        if !((defined?(batchid)).nil?)

        slot = Slot.new
        Batch.find(batchid).slots << slot
         Subject.find(params[:subject_id]).slots << slot
         Teacher.find(tid).slots << slot
         Timeslot.find(params[:tsid]).slots << slot
         Room.find(params[:room]).slots << slot
        end
    end
    flash[:notice] = "Slot assigned in table succesfully."
  redirect_to controller: 'timeslots' , action: 'index', year: params[:year]
  end

  # PATCH/PUT /slots/1
  # PATCH/PUT /slots/1.json
  def update
    respond_to do |format|
      if @slot.update(slot_params)
        format.html { redirect_to @slot, notice: 'Slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @slot }
      else
        format.html { render :edit }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slots/1
  # DELETE /slots/1.json
  def destroy
    @slot.destroy
    respond_to do |format|
      format.html { redirect_to slots_url, notice: 'Slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_slot
    #   @slot = Slot.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slot_params
      params.permit(:tsid, :year, :subject_id, :room, :batches => [])
    end
end
