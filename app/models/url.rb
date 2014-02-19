class Url < ActiveRecord::Base
  require 'securerandom'
  before_save :generate_short_url
  validates :url, format: { with: /\Aw{3}\.\w+\.\w{3}\z/, message: 'Invalid URL'}

  def self.generate_short_url
    ending = SecureRandom.hex(2)
    return "www.awesome.com/#{ending}"
  end
end
