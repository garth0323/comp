class Inquiry < ActiveRecord::Base
  belongs_to :visitor
  has_many :date_sells

  validates_presence_of :address
  
  def self.search_results(address)
    value = Inquiry.estimate(address)
    value.split("$")[1]
    value.gsub(/[,$]/, '') 
  end

  def self.estimate(address)
    mechanize = Mechanize.new
    page = mechanize.get('http://www.zillow.com/find-your-home/')
    form = page.forms.first
    form.citystatezip = address
    page = form.submit
    mechanize.page.search(".zsg-tooltip-launch_keyword+ span").text
  end

end

