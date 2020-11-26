require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'Has one creator' do
    user = User.create(name: 'john', email: 'john@example.com', password: 'password')
    event = Event.create(date: '2020-12-13 00:00:00', title: 'tests', description: 'this is another test',
                         location: 'test database sss', creator_id: user.id)
    expect(event.id).to be_an Integer
  end

  it 'Has many attendees' do
    user = User.create(name: 'john', email: 'john@example.com', password: 'password')
    event = user.created_events.build(date: '2020-12-12 00 00 00', title: 'test',
                                      description: 'this is a test', location: 'test database')
    user.attended_events << event
    expect(event.event_attender_ids).to be_an Array
  end
end
