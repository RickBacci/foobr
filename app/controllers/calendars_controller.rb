class CalendarsController < ApplicationController

  def primary
    @cal = current_user.calendar_client.list_events('primary')
    render json: @cal
  end
end
