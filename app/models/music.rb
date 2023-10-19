class Music < ApplicationRecord
    has_many :songs, dependent: :destroy
    validates :content, uniqueness: true
    mount_uploader :image, ImageUploader
end
