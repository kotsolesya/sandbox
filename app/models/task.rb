class Task < ApplicationRecord
  belongs_to :list
  validates :title, presence: true,
                    length: { minimum: 3 },
                    uniqueness: { scope: :list_id }

  scope :filtered, ->(type) { send(type) if type }
  scope :done, -> { where(done: true) }
  scope :open, -> { where(done: false) }

  def self.order_task(sort_order)
    if sort_order == 'newest' || sort_order.blank?
      order(created_at: :desc)
    elsif sort_order == 'title'
      order(title: :asc)
    else
      order(created_at: :asc)
    end
  end
end
