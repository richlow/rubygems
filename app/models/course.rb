class Course < ApplicationRecord
    validates :title, :short_description, :language, :price, :level, presence: true
    validates :description, presence: true, length: { :minimum => 5 }
    has_rich_text :description
    belongs_to :user
    def to_s
        title
    end
    extend FriendlyId
    friendly_id :title, use: :slugged
end
