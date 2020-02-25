class Card
    attr_reader :balance
    attr_accessor :status

    def initialize
        @balance = 0
        @fare = 5
        @status = false
    end

    def top_up(value)

        fail "balance too high" if over_limit?(value)

        @balance += value
    end


    def tap_out
        deduct(@fare)
        @status = false
    end

    def tap_in
        fail "insufficient balance" if @balance < 1
        @status = true
    end

    def in_journey?
        @status
    end





    private

    def over_limit?(value)
        @balance + value > 50
    end
    def deduct(value)
      @balance-=value

    end


end
