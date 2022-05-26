json.extract! post, :id, :title, :content, :classid, :authorid, :replies, :created_at, :updated_at
json.url post_url(post, format: :json)
