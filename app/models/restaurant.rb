require 'factual'

class Restaurant

  def self.factual
    Factual.new(ENV['factual_OAuth_key'], ENV['factual_OAuth_secret'])
  end

  def self.details(factual_id)
    factual.table("places-us").row(factual_id)
  end

  def self.kid_friendly(query)
    if query == "true"
      self.restaurants_with_kids
    elsif query == "false" || query == nil
      self.restaurants_without_kids
    else
      self.restaurants_for_either
    end
  end

  def self.restaurants_with_kids
    factual.table("restaurants-us")
    .filters({"$and" => [{"kids_goodfor" => {"$blank" => false}}, {"category_ids" => {"$excludes" => 332}},
             {"$and" => [{"category_ids" => {"$includes" => 347}}, {"kids_goodfor" => "true"}]}]})
             .geo("$circle" => {"$center" => [39.749747, -104.999782], "$meters" => 5000}).rows
  end

  def self.restaurants_without_kids
    factual.table("restaurants-us")
    .filters({"$and" => [{"kids_goodfor" => {"$blank" => true}}, {"category_ids" => {"$excludes" => 332}},
             {"$or" => [{"category_ids" => {"$includes" => 347}}, {"kids_goodfor" => "false"}]}]})
             .geo("$circle" => {"$center" => [39.749747, -104.999782], "$meters" => 5000}).rows
  end

  def self.restaurants_for_either
    factual.table("restaurants-us")
      .geo("$circle" => {"$center" => [39.749747, -104.999782], "$meters" => 5000}).rows
  end
end
