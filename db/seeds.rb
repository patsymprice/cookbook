# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "open-uri"
require "twilio-ruby"

i = 0
name_arr = []
content_arr = []
lamb = Nokogiri::HTML(open("http://www.bonappetit.com/ideas/lamb-shank-recipes/search"))
lamb.css(".contentDescription").each do |content| content_arr << content.content end
lamb.css("li.title").each do |name| name_arr << name.content end

while  i < name_arr.length
  @recipe = Recipe.create(:name => "#{name_arr[i]}", :content => "#{content_arr[i]}" )
  i += 1
end


@client = Twilio::REST::Client.new('ACc2b6db18318806473b6caf6bcc3ee456','cbeac64dd42f5d84cff7d07c3eefaaab')
binding.pry
@client.account.sms.messages.create(
  :from => '+14085122239',
  :to => '+14082187521',
  :body => "#{name_arr.count.to_s} has been updated from Bon Apetit"
)
