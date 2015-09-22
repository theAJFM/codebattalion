class Problem < ActiveRecord::Base
    validates :ProblemName, presence: true
    validates :ProblemDescription, presence: true
end
