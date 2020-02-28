require_relative 'journey'

class JourneyLog

    attr_reader :history, :journey

    def initialize
        @history = []
        @entry_station
        @journey
    end

    def start(station)
        current_journey(station, nil)
        @entry_station = station
    end

    def finish(station)
        current_journey(@entry_station, station)
        @history.push(@journey)
    end

    private

    def current_journey(entry_station, exit_station)
        @journey = Journey.new(entry_station, exit_station)
    end

end