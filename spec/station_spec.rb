# frozen_string_literal: true

require 'station'

describe Station do
  it 'checks if station exits' do
    expect { subject }.not_to raise_error
  end
end
