module EventsHelper
  def loop_through_next(array)
    array.next_events.each do |event|
      concat breadcrumb(event)
    end
  end

  def loop_through_prev(array)
    array.prev_events.each do |event|
      concat breadcrumb(event)
    end
  end
  
  def hide_panel(event)
    concat content_tag(:div,
                            if current_user.attended_events.include?(event) || Date.parse(event.date.to_s).past?
                              content_tag(:span, (button_to 'Attend Event', attend_path, params: { event_id: @event.id }, method: 'get', class: 'list-group-item btn btn-success btn-lg disabled', 'aria-disabled' => "true"))
                            else
                              content_tag(:span, (button_to 'Attend Event', attend_path, params: { event_id: @event.id }, method: 'get', class: 'btn btn-success btn-lg'))
                            end,
                            class: 'list-group')
  end


  private
  def breadcrumb(event)
    content_tag :div, class: 'breadcrumb mb-3 d-flex justify-content-between w-50 mx-auto' do
      concat(event.title)
      concat(content_tag(:span, (link_to 'View Event', event_path(event.id), class: 'btn btn-sm btn-success')))
    end
  end
end