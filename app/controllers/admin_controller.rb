# frozen_string_literal: true

class AdminController < ApplicationController
  helper_method :collection,
                :resource_force_rate

  def create
    @resource_force_rate = ForceRate.new(force_rate_params.to_h.merge(user_id: current_user.id))
    if @resource_force_rate.save
      flash[:notice] = 'Force rate was successfully created'
      stream(@resource_force_rate.rate)
      activate_job(@resource_force_rate)
      render :new
    else
      flash.now[:alert] = 'Form validation failed. Please fix all fields highlighted in red'
      render :new
    end
  end

  private

  def force_rate_params
    params.require(:force_rate).permit(:rate, :expire_datetime)
  end

  def collection
    ForceRate.order(id: :desc).all
  end

  def resource_force_rate
    @resource_force_rate ||= ForceRate.last&.dup || ForceRate.new
  end

  def stream(rate)
    ActionCable.server.broadcast 'rate', rate: rate, from: 'Update force currency from admin'
  end

  def activate_job(force_rate)
    local_expire_datetime = force_rate.expire_datetime.localtime
    wait_until = local_expire_datetime - (local_expire_datetime.utc_offset)
    PushCbrRateJob.set(wait_until: wait_until).perform_later
  end
end