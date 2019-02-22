require_relative '../lib/parser'
require 'rspec'

describe Parser do

  before(:each) do
    @parser = Parser.new('src/testserver.log')
    @parser.parse
  end

  it 'can return an array of urls' do
    expect(@parser.urls[0]).to eq('/help_page/1')
  end

  it 'can return an array of ip addresses' do
    expect(@parser.ips[0]).to eq('126.318.035.038')
  end
end
