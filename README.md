# Parse information from a .log file

Using this repo, you can view full details of a browsing log, and return them as:

- A list of pages ordered from most to least views

- A list of pages ordered from most to least unique views

## Getting started

1. Clone repo

2. Install dependencies: `bundle install`

## Using the app

1. Open `irb`

2. Load up the file: `load 'lib/parser.rb'`

3. Declare a new instance of `Parser`, passing in the log file: `p = Parser.new('src/webserver.log')`

4. Call the `parse` method: `p.parse`

You should now be able to see a list of urls and ip addresses separately by calling `p.urls` or `p.ips`

You can also see how these strings are pairing by calling `p.url_ip_pairs`

To see a hash of pages ordered by views: `p.show_visits`

To see a hash of pages ordered by unique views: `p.show_unique_visits`

When calling the two method above, you should also see a formatted list in stdout

## Running the tests

Run: `rspec`

You should see a coverage report from SimpleCov

The specs are using a test .log file, containing only the first ten lines of the original .log file

## Linting

Run: `rubocop`
