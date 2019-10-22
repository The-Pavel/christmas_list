require 'nokogiri'
require 'open-uri'

def idea_item(item_i_want)
  etsy_search = []

  url = "https://www.etsy.com/search?q=#{item_i_want}"
  # 1. We get the HTML page content
  html_content = open(url).read
  # 2. We build a Nokogiri document from this file
  doc = Nokogiri::HTML(html_content)
# 3. We search for the correct elements containing the items' title in our HTML doc
  # 4. For each item found, we extract its title and print it
  doc.search('.text-gray.text-truncate').first(5).each do |element|
    etsy_search << element.text.strip
  end

  return etsy_search.each_with_index { |item, index| puts "#{index + 1} - #{item}"}
end
