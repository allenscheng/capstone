require "unirest"
require "pp"
system "clear"

puts "1 to create a new user"
puts "2 to view all wishlists"
puts "2.1 to create a new wishlist"
puts "3 to view all dailydeals"
puts "3.1 to create new dailydeal"
puts ""
puts "[signup] - Signup"
puts "[login] - Login"
puts "[logout] - Logout"
user_choice = gets.chomp

base_url = "http://localhost:3000"

if user_choice == "1"
elsif user_choice == "2"
  response = Unirest.get("#{base_url}/lists")
  lists = response.body
  pp lists 
elsif user_choice == "2.1"
  params = {}
  print "Enter new wishlist link: "
  params[:product_link] = gets.chomp
  response = Unirest.post("#{base_url}/lists", parameters: params)
  list = response.body 
  pp clothes
elsif user_choice == "3"
  response = Unirest.get("#{base_url}/deals")
  deals = response.body
  pp deals  
elsif user_choice == "3.1"
  params = {}
  print "Enter the deal name: "
  params[:name] = gets.chomp
  print "Enter the deal description: "
  params[:description] = gets.chomp
  print "Enter the deal price: "
  params[:price] = gets.chomp
  print "Enter the deal color: "
  params[:color] = gets.chomp
  print "Enter the product link of deal: "
  params[:product_link] = gets.chomp 
  response = Unirest.post("#{base_url}/deals", parameters: params)
  deals = response.body 
  pp deals
elsif user_choice == "signup"
  params = {}
  print "First name: "
  params[:first_name] = gets.chomp  
  print "Last name: "
  params[:last_name] = gets.chomp   
  print "Email: "
  params[:email] = gets.chomp  
  print "Password: "
  params[:password] = gets.chomp  
  print "Password confirmation: "
  params[:password_confirmation] = gets.chomp  
  response = Unirest.post("#{base_url}/users", parameters: params)
  user = response.body
  pp user 
elsif user_choice == "login"

elsif user_choice == "logout"

end