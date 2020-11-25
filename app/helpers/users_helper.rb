module UsersHelper
  def created_events
    current_user.created_events.each do |e|
      concat card(e)
    end
  end

  def upcomming_events
    current_user.attended_events.next_events.each do |e|
      concat card(e)
    end
  end

  def past_events
     current_user.attended_events.prev_events.each do |e|
      concat card(e)
    end
  end

  private
  def card_body_holder(event)
    content_tag :div, class: "card-body" do
      concat(content_tag(:p, event.description, class: "card-text"))
      concat(content_tag(:p, event.location, class: "card-text"))
      concat(content_tag(:p, event.date, class: "card-text"))
      concat(content_tag(:span, (link_to 'View Event', event_path(event.id), class: 'btn btn-primary')))
    end
  end

  def card(event)
    content_tag :div, class: "card text-center mb-5" do
        concat(content_tag(:div, event.title, class: "card-header"))
        concat(card_body_holder(event))
        concat(content_tag(:div, "Created at: #{event.created_at}", class: "card-footer text-muted"))
      end
  end
end

