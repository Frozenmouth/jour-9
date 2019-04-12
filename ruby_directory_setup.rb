def check_if_user_gave_input
  abort("mkdir: Please add a name to your folder") if ARGV.empty?
  end

def get_folder_name
  return rename = ARGV.first
end

def create_folder(rename)
	rename = get_folder_name
	# Setting up new folder with input text from the user
  Dir.mkdir("/Users/alexis/#{rename}")
  # Setting up new lib sub-folder
  Dir.mkdir("/Users/alexis/#{rename}/lib") 
  # Creation of .env file
  File.open("/Users/alexis/#{rename}/.env", "w+")
  # Creation of README.md file
  File.open("/Users/alexis/#{rename}/README.md", "w+")
  # Creation of .gitignore file
  File.open("/Users/alexis/#{rename}/.gitignore", "w+") do |line|
    line puts ".env"
  end
  # Creation of the gemfile with all the gems pre-written in it
  File.open("/Users/alexis/#{rename}/Gemfile", "w+") do |line|
    line puts "source \'https://rubygems.org'\ ruby '2.5.3' \ gem 'pry' \ gem 'rspec' \ gem 'watir' \n"
  end

# Repositioning in the fresh created folder of the user
Dir.chdir("/Users/alexis/#{rename}/")
# Setting up rspec
system("rspec --init")
# initialize git init
system("git init")
# Gemfile.lock setup
system("bundle install")
end

def perform
  rename = get_folder_name
  check_if_user_gave_input
  create_folder(rename)
end

perform



