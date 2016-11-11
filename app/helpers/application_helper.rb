module ApplicationHelper


  def cents_to_dollars(cents)
    dollars = "$" + (cents/100)
  end
end
