# frozen_string_literal: true

every 30.minutes do
  runner 'ScheduleService.call'
end
