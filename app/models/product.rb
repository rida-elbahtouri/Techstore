class Product < ApplicationRecord
  belongs_to :seller, class_name: 'User'

  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  has_many :baskets, dependent: :destroy
  has_many :customers, through: :baskets, foreign_key: 'customer_id', dependent: :destroy
  has_rich_text :content
  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :description, presence: true, length: { minimum: 20 }
  validates :price, presence: true
  validates :promotion, presence: true
  validates :categ, presence: true
  scope :mosts, -> { Product.order('selletimes DESC').limit(5) }
  scope :hurryup, -> { Product.order('promotion DESC').limit(4) }
  scope :searsh, ->(term) { where('name LIKE ? OR description LIKE ?', term, term) }

  def avg
    ratings.average(:stars).to_f
  end

  #   need to improve
  # def ratingsstatic
  #   one = ratings.where(stars: 1).count
  #   two = ratings.where(stars: 2).count
  #   three = ratings.where(stars: 3).count
  #   four = ratings.where(stars: 4).count
  #   five = ratings.where(stars: 5).count

  #   { one: one,
  #     two: two,
  #     three: three,
  #     four: four,
  #     five: five,
  #     total: one + two + three + four + five }
  # end
  # rubocop:disable Metrics/MethodLength
  def ratingsstatic
    one = 0
    two = 0
    three = 0
    four = 0
    five = 0
    ratings.each do |r|
      if r.stars == 1
        one += 1
      elsif r.stars == 2
        two += 1
      elsif r.stars == 3
        three += 1
      elsif r.stars == 4
        four += 1
      elsif r.stars == 5
        five += 1
      end
    end
    { one: one,
      two: two,
      three: three,
      four: four,
      five: five,
      total: one + two + three + four + five }
  end
  # rubocop:enable Metrics/MethodLength
end
