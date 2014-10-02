require 'pry'

class Page
  def initialize(options = {})
    @header = options["header"]
    @article = options["article"]
    @timestamp = options["timestamp"]
    @page ||= {}
    @header ||= ""
    @article ||= ""
  end

  def header
    @header
  end

  def header= (new_header)
    @header = new_header
  end

  def article
    @article
  end

  def article= (article_new)
    @article = article_new
  end

  def timestamp
    @timestamp
  end

  def timestamp= time_new
    @timestamp= time_new
    time_new= Time.new
  end

  def to_s
    p "Header: #{@header}\nTime: #{@timestamp}\nArticle: #{@article}"
  end
end
