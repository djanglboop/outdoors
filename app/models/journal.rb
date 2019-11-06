class Journal < ApplicationRecord
    belongs_to :user
    validates :title, :subtitle, :image_url, :description, :image, presence: true
    validates :title, uniqueness: true, length: { minimum: 3, maximum: 30 }
    validates :image_url, :image, allow_blank: true, format: { 
        with: %r{\.(gif|jpg|png)\Z}i, 
        message: 'must be URl for GIF, JPG or PNG image.'
     }
end
