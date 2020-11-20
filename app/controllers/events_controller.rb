class EventsController < ApplicationController

  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:sucess] = 'Event was successfully created'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :location)
  end

end
