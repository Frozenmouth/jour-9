#Usage of the launchy gem to open in the browser the desired page after execution of the program.
require 'launchy'

#Verification of the search carried out by the user. If the search is empty, the execution is interrupted.
def instruct_and_abort_if_user_gave_no_input
  if ARGV.empty?
  	abort("Error - Search input empty - you shall enter '$ ruby google_searcher.rb 'your search on Google''")
  end
end

#Creating the Google research link.
def build_google_search_url
	'https://www.google.com/search?q='+ARGV.to_a.join('+')
end

#Once the research is done, the result page opens automatically in the browser.
def launch_google_search
	Launchy.open(build_google_search_url)
end

#Execute methods in the correct order.
def perform
	instruct_and_abort_if_user_gave_no_input
	launch_google_search
end

perform