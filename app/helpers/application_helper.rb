module ApplicationHelper

  def ninety_days_from_today
    90.days.from_now.strftime("%B %d, %Y")
  end

  def eighty_percent(value)
    price = (value.to_i * 0.8).to_i
    return number_to_currency(price)
  end

  def ninety_percent(value)
    price = (value.to_i * 0.95).to_i
    return number_to_currency(price)
  end

  def hundred_percent(value)
    price = value.to_i
    return number_to_currency(price)
  end

  def hundred_five_percent(value)
    price = (value.to_i * 1.05).to_i
    return number_to_currency(price)
  end
  
end
