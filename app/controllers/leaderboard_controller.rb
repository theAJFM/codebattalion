class LeaderboardController < ApplicationController
    def index
      	@hackers = Hacker.order(rating: :desc)
      	@count = 0
    end
end
