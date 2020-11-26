require 'rails_helper'

RSpec.describe EventsHelper, type: :helper do
  let(:another_event) do
    Event.create(date: '2020-12-11 00:00:00', location: 'Baghdad',
                 title: 'Testing', description: 'Just for test', creator_id: 2)
  end
  let(:event) do
    Event.create(date: '2020-12-11 00:00:00', location: 'Baghdad',
                 title: 'Test', description: 'Just for test', creator_id: 1)
  end
  let(:events) { Event.all }
  describe 'loop_through_next' do
    it 'returns an array of html strings' do
      expect(loop_through_next(events)).to be_an Array
    end
  end

  describe 'loop_through_prev' do
    it 'returns an array of html strings' do
      expect(loop_through_prev(events)).to be_an Array
    end
  end
end
