# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  tags       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ApplicationRecord
    include PgSearch::Model

    validates :title, presence: true
    validates :content, presence: true

    pg_search_scope :search_by_content,
        against: [:title, :content, :tags],
        using: {
            tsearch: { prefix: true }
        }

    def tag_list
        tags.to_s.split(',').map(&:strip).reject(&:blank?)
    end

    def tag_list=(value)
        self.tags = value.is_a?(Array) ? value.join(', ') : value
    end

    scope :recent, -> { order(updated_at: :desc) }
end
