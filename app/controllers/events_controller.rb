class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
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
