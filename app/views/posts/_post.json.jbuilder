json.extract! post, :id, :title, :content, :is_publish, :publish_date, :view_count
json.author post.user.name
