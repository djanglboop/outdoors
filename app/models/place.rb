class Place < ApplicationRecord
    validates :title, :subtitle, :description, :image_url, presence: true
    validates :title, uniqueness: true, length: { minimum: 5 }
    validates :image_url, allow_blank: true, format: { 
        with: %r{\.(gif|jpg|png)\Z}i, 
        message: 'must be URl for GIF, JPG or PNG image.'
     }
end
