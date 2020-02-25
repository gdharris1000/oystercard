# frozen_string_literal: true

class Card
  attr_reader :balance
  attr_accessor :status
  MIN_BAL = 1
  LIMIT = 90

  def initialize
    @balance = 0
    @fare = 5
    @status = false
  end

  def top_up(value)
    raise 'balance too high' if over_limit?(value)

    @balance += value
  end

  def tap_out
    deduct(@fare)
    @status = false
  end

  def tap_in
    raise 'insufficient balance' if @balance < MIN_BAL
    @status = true
  end

  def in_journey?
    @status
  end

  private

  def over_limit?(value)
    @balance + value > LIMIT
  end

  def deduct(value)
    @balance -= value
  end
end
