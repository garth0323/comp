class Inquiry < ActiveRecord::Base
  belongs_to :visitor
  has_many :date_sells

  validates_presence_of :address
  
  def self.search_results(address)
    Inquiry.estimate(address)
  end

  def self.estimate(address)
    mechanize = Mechanize.new
    page = mechanize.get('http://www.zillow.com/find-your-home/')
    form = page.forms.first
    form.citystatezip = address
    page = form.submit
    one = mechanize.page.search(".zsg-tooltip-launch_keyword+ span").text
    two = mechanize.page.search(".off-market-row+ .home-summary-row .zsg-tooltip-launch_keyword+ span").text
    Inquiry.decide_which_result(one, two)
  end

  def self.decide_which_result(one, two)
    val = two.to_s.gsub(/[^0-9]/, '')
    if val.to_i == 0
      return one.to_s.gsub(/[^0-9]/, '')
    else
      return val
    end
  end
end

