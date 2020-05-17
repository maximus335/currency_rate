# frozen_string_literal: true

class PushCbrRateJob < ApplicationJob
  queue_as :default

  def perform
    rate = RateService::Cbr.call || ''
    ActionCable.server.broadcast 'rate', rate: rate, from: 'ActiveJob'
  end
end