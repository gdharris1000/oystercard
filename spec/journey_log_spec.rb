require 'journey_log'

describe JourneyLog do

    let(:entry_station) { double :station }
    let(:exit_station) { double :station }


    it 'journey_log initialises' do
        expect{subject}.not_to raise_error
    end

    it 'history is an empty array on initialisation' do
        expect(subject.history).to be_empty
    end

    describe "start" do
        it "responds to 1 argument" do
            expect(subject).to respond_to(:start).with(1).argument
        end

        it 'Adds station to @entry_station variable' do
            subject.instance_variable_set(:@entry_station, nil)
            subject.start(entry_station)
            expect(subject.instance_variable_get(:@entry_station)).to eq entry_station
          end

        it 'checks if the journey is already in progress' do
            subject.instance_variable_set(:@entry_station, entry_station)
            expect{subject.start(entry_station)}.to raise_error "journey already in progress"
        end

    end

    describe 'finish' do
        it 'responds to 1 argument' do
            expect(subject).to respond_to(:finish).with(1).argument
        end

        it 'adds the journey to the history array' do
            subject.instance_variable_set(:@entry_station, entry_station)
            subject.finish(exit_station)
            expect(subject.history).to include subject.instance_variable_get(:@journey)
        end


    end
end

