class Post < ApplicationRecord
    has_rich_text :body
    belongs_to :user
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings, dependent: :destroy

    def tag_list
        self.tags.collect do |tag|
            tag.name
        end.join(", ")
    end

    def tag_list=(tags_string)
        tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
        new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
        self.tags = new_or_found_tags
    end

end
