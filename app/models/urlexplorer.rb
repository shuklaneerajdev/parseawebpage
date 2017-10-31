require 'open-uri'
class Urlexplorer < ApplicationRecord
  validate :url_must_be_valid
  before_commit :get_content_and_parse_and_store, on: :create

  def url_must_be_valid
    if !is_valid_url(url)
      errors.add(:url, "This is not a valid URL. Please enter a correct url")
    end
  end

  def is_valid_url(value)
    uri = URI.parse(value)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def get_content_and_parse_and_store
    Rails.logger.debug { "The URL is #{self.url}" }
    file = open(self.url)
    self.update_attribute(:content,file.read)
    document = Nokogiri::HTML(self.content)
    parsed_data = Hash.new
    h1s_array = Array.new
    document.search('h1').each do |current|
      h1s_array << current.text
      puts current.text
    end
    parsed_data['h1'] = h1s_array
    h2s_array = Array.new
    document.search('h2').each do |current|
      h2s_array << current.text
      puts current.text
    end
    parsed_data['h2'] = h2s_array
    h3s_array = Array.new
    document.search('h3').each do |current|
      h3s_array << current.text
      puts current.text
    end
    parsed_data['h3'] = h3s_array
    self.update_attribute(:parsed_headers, parsed_data.to_json)
    self.update_attribute(:is_parsing_done, true)
  end
end
