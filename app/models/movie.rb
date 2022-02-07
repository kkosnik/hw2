class Movie < ApplicationRecord
    has_many :roles
    #belongs_to :director, through :movies, source :person
end
