require_relative 'github_user'

#Information about users
#method '.all_users' should return array of user logins
puts "Github users: #{ Github::User.all_users }"

#initialize new GithubUser
user = Github::User.new

#set user name
puts 'Enter user account name on github:'
user.name = gets.chomp!

#show user info
#method '#info' should return parsed information about user
puts "User info: #{ user.info }"

#show user id
#method '#id' should return user id from user info
puts "User id is: #{ user.id }"

#show user repos
#method '#repos' should return parsed information about user repos
puts "User repos are: #{ user.repos }"

#show user repos names
#method '#repos_names' should return array of user repos names
puts "User repos are: #{ user.repos_names }"

#show size of user repos
#method '#total_repos_size' should return total size of user repos
#you can get it from repos information
puts "Total repos size: #{ user.total_repos_size }"

#show user prefferable language
#method '#prefferable_languages' should get languages from
#user repos. Then you should count how many times each
#language occurs in that array and get languages with max count
puts "Prefferable languages are: #{ user.prefferable_languages }"