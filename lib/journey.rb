class Journey

    attr_reader :entry_station, :exit_station, :fare

    MIN_FARE = 2
    PENALTY = 6

    def initialize(entry_station = nil, exit_station = nil)
        @entry_station = entry_station
        @exit_station = exit_station
        @fare
    end


    def fare_calc
        @entry_station == nil || @exit_station == nil ? @fare = PENALTY : @fare = MIN_FARE
    end

end