require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Should create a user' do
    User.create(name: 'john', email: 'john@example.com', password: 'password')
    expect(User.all.count).not_to eq(0)
  end

  it 'Should not create a user without name' do
    user = User.create(email: 'john@example.com', password: 'password')
    expect(user.id).to be nil
  end

  it 'Should not create a user without email' do
    user = User.create(name: 'John', password: 'password')
    expect(user.id).to be nil
  end

  it 'Should not create a user without password' do
    user = User.create(name: 'Jon', email: 'john@example.com')
    expect(user.id).to be nil
  end

  it 'Should create an event' do
    user = User.create(name: 'john', email: 'john@example.com', password: 'password')
    event = user.created_events.build(date: '2020-12-12 00 00 00', title: 'test', description: 'this is a test', location: 'test database')
    expect(event.creator_id).to eql(user.id)
  end

  it 'Can attend many events' do
     user = User.create(name: 'john', email: 'john@example.com', password: 'password')
     event = user.created_events.build(date: '2020-12-12 00 00 00', title: 'test', description: 'this is a test', location: 'test database')
     user.attended_events << event
     expect(event.event_attender_ids.first).to eql(user.id)
  end

end
