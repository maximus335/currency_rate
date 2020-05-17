# frozen_string_literal: true

class RateService
  class Cbr
    URL = 'http://www.cbr.ru/scripts/XML_daily.asp'
    REGEXP = %r{<Valute ID="R01235">.*<Value>(.*)</Value>.*</Valute>}.freeze

    def self.call
      new.call
    end

    def call
      response = HTTP.get(URL)
      REGEXP.match(response)[1]
    rescue StandardError => e
      Rails.logger.error { "[RATE_FROM_CBR]: #{e.class}: #{e.message}" }
      nil
    end
  end
end