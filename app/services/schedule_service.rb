# frozen_string_literal: true

class ScheduleService
  def self.call
    new.call
  end

  def call
    rate = RateService.call
    return if rate.blank?

    ActionCable.server.broadcast('rate',
                                 rate: rate, from: 'Update from schedule')
  end
end