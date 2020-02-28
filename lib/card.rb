require_relative 'journey'
require_relative 'station'
require_relative 'journey_log'

class Card
  attr_reader :balance, :entry_station, :journey_log

  MIN_BAL = 1
  LIMIT = 90

  def initialize
    @balance = 0
    @entry_station
    @journey_log = JourneyLog.new
    @journey
  end

  def top_up(value)
    raise 'balance too high' if over_limit?(value)
    @balance += value
  end

  def tap_in(station)
    fail 'insufficient balance' if @balance < MIN_BAL
    
    @journey_log.start(station)

    if in_journey?
      deduct(@journey_log.journey.fare_calc)
    end
    
      @entry_station = station

  end

  def tap_out(station)
    @journey_log.finish(station)
    deduct(@journey_log.history[-1].fare_calc)
  end
  
  def in_journey?
    @entry_station != nil
  end

  private

  def over_limit?(value)
    @balance + value > LIMIT
  end

  def deduct(fare)
    @balance -= fare
    # push_history
  end

  # def push_history
  #   @history.push(@journey)
  # end

end
