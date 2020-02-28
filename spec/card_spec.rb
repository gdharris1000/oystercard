require 'card'
require 'journey'

describe Card do

  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:topup) {subject.instance_variable_set(:@balance, 10)}

  # it 'check the journey is array on initialisation' do
  #   expect(subject.history).to eq []
  # end

  describe 'top_up' do

    it 'adds money to the balance' do
      expect{ subject.top_up(10) }.to change{ subject.balance }.by(10)
    end

    it 'raises error when topping up would put the balance above LIMIT' do
      subject.instance_variable_set(:@balance, Card::LIMIT)
      expect { subject.top_up(1) }.to raise_error "balance too high"
    end
  end

  describe 'tap_out' do

    it 'responds to 1 argument' do
      expect(subject).to respond_to(:tap_out).with(1).arguments
    end

    context 'neither entry and exit stations are nil' do

      before (:each) do
        topup
        #########
        subject.tap_in(entry_station)
      end

      it 'deducts minimum fare' do
        expect { subject.tap_out(exit_station) }.to change { subject.balance }.by(-Journey::MIN_FARE)
      end

      # it 'adds the journey to the journey array' do
      #   card = Card.new
      #   card.tap_out(exit_station)
      #   expect(card.journey_log.history).to include card.instance_variable_get(:@journey)
      # end

    end

  end

  describe 'tap_in' do
    
    it 'tap_in responds to 1 argument' do
      expect(subject).to respond_to(:tap_in).with(1).arguments
    end

    it 'tap_in adds station to @entry_station variable' do
      subject.instance_variable_set(:@entry_station, nil)
      subject.instance_variable_set(:@balance, Card::MIN_BAL)
      subject.tap_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end

    it 'raises error is balance is less than 1 on tap_in' do
      subject.instance_variable_set(:@balance, 0)
      expect { subject.tap_in(:station) }.to raise_error "insufficient balance"
    end
  end

  describe 'in_journey' do
    
    it 'in_journey returns true after tap_in' do
      subject.instance_variable_set(:@balance, Card::MIN_BAL)
      subject.tap_in(entry_station)
      expect(subject).to be_in_journey
    end

    # it 'in_journey returns false after tap_out' do
    #   subject.tap_out(entry_station)
    #   expect(subject).not_to be_in_journey
    # end

  end

end
