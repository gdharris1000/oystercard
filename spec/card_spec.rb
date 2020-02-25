require 'card'

describe Card do

    describe "top_up" do
        it "adds money to the balance" do
            subject.instance_variable_set(:@balance, 0)
            subject.top_up(10)
            expect(subject.balance).to eq 10
        end

        it "raises error when topping up would put the balance over 50" do
            subject.instance_variable_set(:@balance, 50)
            expect{subject.top_up(1)}.to raise_error
        end
    end

    describe "tap_out" do
        it "deducts fare from card balance" do
          subject.instance_variable_set(:@fare, 5)
          subject.instance_variable_set(:@balance, 10)
          expect{subject.tap_out}.to change{subject.balance}.by(-5)
          end

        it "in_journey? returns false when tap_out method is run" do
            subject.instance_variable_set(:@status,true)
            expect{subject.tap_out}.to change{subject.status}.from(true).to(false)
        end

    end

    describe "tap_in" do
        it "in_journey? returns true when tap_in method is run" do
            subject.instance_variable_set(:@balance, 10)
            subject.tap_in
            expect(subject.in_journey?).to eq true
        end

        it "raises error is balance is less than 1 on tap_in" do
            subject.instance_variable_set(:@balance, 0)
            expect{subject.tap_in}.to raise_error
        end
    end

end
