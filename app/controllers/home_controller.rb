# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @rate = RateService.call
  end
end