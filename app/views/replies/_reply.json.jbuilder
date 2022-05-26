json.extract! reply, :id, :content, :postid, :authorid, :creation_date, :created_at, :updated_at
json.url reply_url(reply, format: :json)
