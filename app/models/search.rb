class Search < ActiveRecord::Base
validates :query, presence: true, uniqueness: {message: "already subscribed"}
end
