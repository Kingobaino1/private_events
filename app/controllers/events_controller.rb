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
      flash[:notice] = 'Event was successfully created!'
      redirect_to root_path
    else
      flash[:alert] = "Event wasn't created! Check the inputs!"
      render :new
    end
  end

  # a method to add the event to the attended events array of the current user.
  def attend_event
    current_user.attended_events << Event.find(params[:event_id])
    flash[:notice] = 'Event was successfully added to your attended events!'
    redirect_to user_path
  end

  private

  def event_params
    params.require(:event).permit(:date, :location, :title, :description)
  end
end
