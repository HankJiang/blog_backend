# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  content      :text
#  is_publish   :boolean
#  publish_date :date
#  title        :string
#  view_count   :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
class Post < ApplicationRecord
  belongs_to :user

  scope :by_keyword, -> (keyword) { where("title like '%#{keyword}%'") }

  class << self
    def search_by(params)
      filter = self.includes(:user).where(nil)
      filter = filter.by_keyword(params[:keywords]) if params[:keywords].present?
      filter
    end
  end

  def viewed
    update(view_count: view_count + 1)
  end
end
