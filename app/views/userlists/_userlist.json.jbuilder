json.extract! userlist, :id, :user_id, :group_id, :created_at, :updated_at
json.url userlist_url(userlist, format: :json)
