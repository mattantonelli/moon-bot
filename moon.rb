class Moon
  API_URL = 'http://api.usno.navy.mil/moon/phase?date=today&nump=99'.freeze
  PHASES = {
    'New Moon' => '🌑',
    'First Quarter' => '🌓',
    'Full Moon' => '🌕',
    'Last Quarter' => '🌗'
  }.freeze

  def initialize
    fetch_phases
  end

  def current_phase
    while true
      phase = @phases.first

      if phase[0].include?(Time.now.utc)
        return phase[1]
      else
        @phases.delete_at(0)
        fetch_phases if @phases.empty
      end
    end
  end

  private
  def fetch_phases
    response = RestClient.get(API_URL)
    data = JSON.parse(response.body, symbolize_names: true)[:phasedata]

    @phases = data.each_cons(2).map do |phase, next_phase|
      [date_range(phase)...date_range(next_phase), PHASES[phase[:phase]]]
    end

    names = PHASES.keys
    current_phase = PHASES[names[names.index(data.first[:phase]) - 1]]
    @phases.unshift([Time.now.utc...date_range(data.first), current_phase])
  end

  def date_range(phase)
    Time.parse("#{phase[:date]} #{phase[:time]} UTC")
  end
end
