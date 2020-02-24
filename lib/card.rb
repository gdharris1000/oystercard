class Card
    attr_reader :balance

    def initialize
        @balance = 0
        @fare = 5
    end

    def check_balance
        @balance
    end

    def top_up(value)

        fail "balance too high" if over_limit?(value)

        @balance += value
    end

    def tap_out
        @balance -= @fare
    end

    private

    def over_limit?(value)
        @balance + value > 50
    end
end