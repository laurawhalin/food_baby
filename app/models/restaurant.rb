class Restaurant

  def self.factual
    Factual.new(ENV['factual_OAuth_key'], ENV['factual_OAuth_secret'])
  end

  def self.kid_friendly?(query, location)
    if query
      # location
      factual.table("restaurants-us").filters({"kids_goodfor" => query})
        .geo("$circle" => {"$center" => [location], "$meters" => 5000}).limit(2).rows
    else
      location
      # factual.table("restaurants-us")
      #   .geo("$circle" => {"$center" => [location], "$meters" => 5000}).limit(2).rows
    end
  end
end

# factual.table("restaurants-us").filters({"kids_goodfor" => true}).geo("$circle" => {"$center" => [39.7391500, -104.9847000], "$meters" => 5000}).limit(2).rows
