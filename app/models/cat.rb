class Cat < ActiveRecord::Base

  COLORS = [:grey, :orange, :white, :black, :tabby, :brown]

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates_inclusion_of :sex, in: %w( M F )
  validates_inclusion_of :color, in: COLORS.map(&:to_s)

  has_many :cat_rental_requests, dependent: :destroy

  def age
    now = Time.now.utc.to_date
    now.year - birth_date.year - (birth_date.change(:year => now.year) > now ? 1 : 0)
  end

  def not_denied_requests
    cat_rental_requests.where("status != 'DENIED'").order(:start_date)
  end

end
