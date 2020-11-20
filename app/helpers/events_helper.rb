module EventsHelper

  def attend_event(event)
    current_user.attended_events << Event.find(event.id)
  end
end
