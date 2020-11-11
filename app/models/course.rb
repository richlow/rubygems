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
    
    LANGUAGES = [:"English", :"Russian", :"Polish"]
    def self.languages
        LANGUAGES.map { |language| [language, language] }
    end
    
    LEVELS = [:"Beginner", :"Middle", :"Advanced"]
    def self.levels
        LEVELS.map { |level| [level, level] }
    end
    
    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }
end
