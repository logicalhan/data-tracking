class EventDataController < ApplicationController
  before_action :set_event_datum, only: [:show, :edit, :update, :destroy]

  # GET /event_data
  # GET /event_data.json
  def index
    @event_data = EventDatum.all
  end

  # GET /event_data/1
  # GET /event_data/1.json
  def show
  end

  # GET /event_data/new
  def new
    @event_datum = EventDatum.new
  end

  # GET /event_data/1/edit
  def edit
  end

  # POST /event_data
  # POST /event_data.json
  def create
    params[:event_datum][:tracked_at] = determine_tracked_at(params)
    @event_datum = EventDatum.new(event_datum_params)

    respond_to do |format|
      if @event_datum.save
        format.html { redirect_to @event_datum, notice: 'Event datum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event_datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @event_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_data/1
  # PATCH/PUT /event_data/1.json
  def update
    respond_to do |format|
      if @event_datum.update(event_datum_params)
        format.html { redirect_to @event_datum, notice: 'Event datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_data/1
  # DELETE /event_data/1.json
  def destroy
    @event_datum.destroy
    respond_to do |format|
      format.html { redirect_to event_data_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_datum
      @event_datum = EventDatum.find(params[:id])
    end
    def determine_tracked_at(parameters)
      DateTime.parse(parameters[:tracked_day]) + parameters[:tracked_hour].to_i.hours
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_datum_params
      params.require(:event_datum).permit(:tracked_at, :event_id)
    end
end
