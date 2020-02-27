require 'journey'
require 'station'

describe Journey do
 
    entry_station = Station.new("entry station", 1)
    exit_station = Station.new("exit station", 2)
    journey = Journey.new(entry_station, exit_station)
    journey_no_exit = Journey.new(entry_station, nil)
    journey_no_entrance = Journey.new(nil, exit_station)
    
    it 'initializes without error' do
        expect{journey}.not_to raise_error
    end

    it 'has an entry station' do
        expect(journey.entry_station).to eq entry_station
    end

    it 'has an exit station' do
        expect(journey.exit_station).to eq exit_station
    end

    describe "fare_calc" do

        it "returns min_fare when there is both an entry and exit station" do
            
            expect(journey.fare_calc).to eq Journey::MIN_FARE
        end

        it "returns penalty when entry station is nil" do
            
            expect(journey_no_entrance.fare_calc).to eq Journey::PENALTY
        end

        it "returns penalty when exit station is nil" do
            
            expect(journey_no_exit.fare_calc).to eq Journey::PENALTY
        end

    end

end