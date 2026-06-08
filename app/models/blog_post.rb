class BlogPost
  include ActiveModel::Model

  attr_accessor :title, :date, :slug, :description, :tags, :body, :html

  def published_on
    date.to_date
  end

  def tag_list
    Array(tags)
  end
end
