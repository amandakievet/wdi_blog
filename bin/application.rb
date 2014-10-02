# def blog_entry
# 	puts "Enter a blog title:"
# 	title= gets.chomp

# 	puts "Add content:"
# 	content= gets.

# 	time= Time.new



# 	File.open('document.txt', 'a') do |thing|
# 		thing << "Title: #{title}\nContent: #{content}\n#{time}"
# 	end
# end

# blog_entry

require_relative '../lib/page.rb'
require_relative '../lib/textbook.rb'

puts "Enter a Header:"
header = gets.chomp

puts "Enter an Article:"
article = gets.chomp

time = Time.new

data= 
{
	"header" => header,
	"article" => article,
	"timestamp" => time
}

page = Page.new(data)

textbook = Textbook.new('document.txt')
textbook.insert(page)


