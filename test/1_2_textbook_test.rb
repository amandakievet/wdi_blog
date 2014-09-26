#require 'pry'
require_relative 'test_helper'
require_relative '../lib/page'
require_relative '../lib/textbook'

class TextbookTest < Minitest::Test


  #this hash of attributes gets passed through page.rb's hash to create a new page
  def page_data
    {
     "header" => "The life of Pie",
     "article" => "Wherein our heroes make and eat pies",
     "timestamp" => Time.new(2014, 3, 14, 15, 29, 43)
    }
  end

  def second_page_data
    {
     "header" => "Letter from Dorothy",
     "article" => "Aunty Em: hate you. Hate Kansas. Taking the dog.",
     "timestamp" => Time.new(1939, 8, 15, 12, 30, 0)
    }
  end

  #not really sure what to do with all this
  def file_as_storage #variable that gets its value from this method
    file = Tempfile.new('textbook')
    file.close
    file
  end
  
  def test_can_add_a_page
  #first thing to do, gets done granted page.rb is set up correctly.
    expected_data = page_data #page_data is the hash of info defined above
    page = Page.new(expected_data) #page_data passed through under alias 'expected data'

    textbook = Textbook.new(file_as_storage) #creates new instance of textbook class, taking one parameter file_as_storage which i don't understand (see above)
    textbook.insert(page) #calls insert method passing through parameter of page
    expected = "Header: #{expected_data["header"]}\nTime: #{expected_data["timestamp"]}\nArticle: #{expected_data["article"]}"#basically the same (or totally the same) as for the page.rb file
    actual = textbook.to_s #calls to_s on textbook 
    assert_equal(expected, actual)
  end

  def test_shows_multiple_pages

    expected_data = page_data #test data inserted above
    second_expected_data = second_page_data #more test data inserted above
    page = Page.new(expected_data) #already did this
    page2 = Page.new(second_expected_data) #another page

    textbook = Textbook.new(file_as_storage) #makes a textbook instance
    textbook.insert(page) #already got .insert
    textbook.insert(page2) #should also work for another instance
    #basically, looks like we have to iterate over each textbook instance.to_s, then join them into one
    expected = "Header: #{expected_data["header"]}\nTime: #{expected_data["timestamp"]}\nArticle: #{expected_data["article"]}\nHeader: #{second_expected_data["header"]}\nTime: #{second_expected_data["timestamp"]}\nArticle: #{second_expected_data["article"]}"
    actual = textbook.to_s #but! we have to do this with one command, to.s. this could be an if statement

    assert_equal(expected, actual)
  end

  def test_reads_from_an_existing_file
    
    page_source = file_as_storage
    expected_data = page_data
    second_expected_data = second_page_data
    page = Page.new(expected_data)
    page2 = Page.new(second_expected_data)

    textbook = Textbook.new(page_source)
    textbook.insert(page)
    textbook.insert(page2)

    textbook2 = Textbook.new(page_source)

    expected = "Header: #{expected_data["header"]}\nTime: #{expected_data["timestamp"]}\nArticle: #{expected_data["article"]}\nHeader: #{second_expected_data["header"]}\nTime: #{second_expected_data["timestamp"]}\nArticle: #{second_expected_data["article"]}"
    actual = textbook2.to_s

    assert_equal(expected, actual)
  end

end
