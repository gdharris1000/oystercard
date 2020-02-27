# frozen_string_literal: true

require 'station'

describe Station do

  station = Station.new("station name", 1)

  it 'checks if station exists' do
    expect { station }.not_to raise_error
  end

  it 'check it has a name' do
    expect(station.station_name).to eq "station name"
  end

  it 'check it has a zone' do
    expect(station.zone).to eq 1
  end

end
