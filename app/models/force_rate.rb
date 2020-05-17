# frozen_string_literal: true

class ForceRate < ApplicationRecord
  belongs_to :user, optional: true

  validates :rate, :expire_datetime, presence: true
end
