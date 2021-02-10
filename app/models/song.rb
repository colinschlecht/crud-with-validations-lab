class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year }
    validates :released, inclusion: { in: [ true, false ] } 
    with_options if: :released do |s|
        s.validates :release_year, presence: true
        s.validates :release_year, numericality: { less_than_or_equal_to: DateTime.now.year }
    end
    # validates :release_year, presence: true, if: :released?
    # validates :release_year, numericality: { 
    #     only_integer: true, 
    #     less_than_or_equal_to: ->(_song) { Date.current.year }
    #   }
    
    
    # def released?
    #     self.released == 'false'
    # end
   
end

