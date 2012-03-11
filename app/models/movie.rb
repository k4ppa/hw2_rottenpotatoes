class Movie < ActiveRecord::Base

  def self.all_ratings
    self.find(:all, :select => "DISTINCT rating").map(&:rating)
  end

end
