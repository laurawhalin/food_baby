class Restaurant

  def self.factual
    Factual.new(ENV['factual_OAuth_key'], ENV['factual_OAuth_secret'])
  end

  def self.kid_friendly?(query)
    if query
      factual.table("restaurants-us").filters({"kids_goodfor" => query})
        .geo("$circle" => {"$center" => [location], "$meters" => 5000}).limit(2).rows
    else
      factual.table("restaurants-us")
        .geo("$circle" => {"$center" => [location], "$meters" => 5000}).limit(2).rows
    end
  end
end
