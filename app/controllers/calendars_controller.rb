class CalendarsController < ApplicationController

  def primary
    @cal = current_user.calendar_client.list_events('primary')
    render json: @cal
  end


  def calendar_list
    @cal = current_user.calendar_client.list_calendar_lists
    render json: @cal
  end

  def create_event
    event = {
      'summary' => 'Google I/O 2015',
      'location' => '800 Howard St., San Francisco, CA 94103',
      'description' => 'A chance to hear more about Google\'s developer products.',
      'start' => {
        'dateTime' => '2015-05-28T09:00:00-07:00',
        'timeZone' => 'America/Los_Angeles',
      },
      'end' => {
        'dateTime' => '2015-05-28T17:00:00-07:00',
        'timeZone' => 'America/Los_Angeles',
      },
      'recurrence' => [
        'RRULE:FREQ=DAILY;COUNT=2'
      ],
      'attendees' => [
        {'email' => 'lpage@example.com'},
        {'email' => 'sbrin@example.com'},
      ],
      'reminders' => {
        'useDefault' => false,
        'overrides' => [
          {'method' => 'email', 'minutes' => 24 * 60},
          {'method' => 'popup', 'minutes' => 10},
        ],
      },
    }

    results = current_user.calendar_client.execute!(
      :api_method => current_user.calendar_client.events.insert,
      :parameters => {
        :calendarId => 'primary'},
        :body_object => event)
    event = results.data
    puts "Event created: #{event.htmlLink}"
  end
end
