require "http"

system "clear"
puts "index or show"
puts "[1] for index"
puts "[2] for show"
puts "[3] to delete"
puts "[4] to update"

input_option = gets.chomp
if input_option == "1"
  response = HTTP.get("http://localhost:3000/products")
  products = JSON.parse(response.body)
  puts "All the products in the store are: #{products} "
elsif input_option == "2"
  puts "type an id"
  index = gets.chomp
  response = HTTP.get("http://localhost:3000/products/#{index}")
  product = JSON.parse(response.body)

  puts "showing product #{product} "
elsif input_option == "3"
  puts "type an id"
  index = gets.chomp
  response = HTTP.delete("http://localhost:3000/products/#{index}")
  product = JSON.parse(response.body)

  puts "showing product #{product} "
elsif input_option == "4"
  puts "type an id"
  index = gets.chomp
  response = HTTP.patch("http://localhost:3000/products/#{index}")
  product = JSON.parse(response.body)
  puts "what you wanna change"
  change = gets.chomp
  if change == "name"
    puts "enter name"
    n_name = gets.chomp
    product2 = HTTP.post("http://localhost:3000/products/#{index}", :json => { :name => n_name })
  end
  puts "showing product #{product2} "
end
