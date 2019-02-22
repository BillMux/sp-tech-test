class Parser
  attr_reader :urls, :ips, :url_ip_pairs, :visits

  def initialize(filename)
    @file = File.open(filename)
    @urls  = []
    @ips = []
    @url_ip_pairs = []
    @visits = Hash.new(0)
    @unique_visits = Hash.new(0)
  end

  def parse
    create_arrays
    create_url_ip_hashes
  end

  def show_visits
    @urls.each { |url| @visits[url] += 1 }
    @visits.sort_by { |_url, count| count }.reverse.to_h
  end

  def show_unique_visits
    @url_ip_pairs.uniq.each do |hash|
      hash.each do |url, ip|
        @unique_visits[url] += 1
      end
    end
    @unique_visits.sort_by { |_url, count| count }.reverse.to_h
  end

  private

  def create_url_ip_hashes
    for x in 0...@urls.length
      @url_ip_pairs[x] = { @urls[x] => @ips[x] }
    end
  end

  def create_arrays
    @file.readlines.each do |line|
      @urls << line.split(' ').first
      @ips << line.split(' ').last
    end
  end
end
