# frozen_string_literal: true

class RateService
  def self.call
    new.call
  end

  def call
    expire_force_rate? ? rate_from_cbr : force_rate.rate.to_s
  end

  private

  def expire_force_rate?
    return true unless force_rate

    local_expire_datetime = force_rate.expire_datetime.localtime
    local_expire_datetime - (local_expire_datetime.utc_offset) < Time.now
  end

  def rate_from_cbr
    Cbr.call
  end

  def force_rate
    @force_rate ||= ForceRate.last
  end
end