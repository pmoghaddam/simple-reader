class API < Grape::API
  version 'v1', :using => :path
  format :json

  helpers do
    def current_user
      @current_user ||= User.authorize!(env)
    end

    def authenticate!
      error!('401 Unauthorized', 401) unless current_user
    end
  end

  resources :feed_items do

    desc "Mark a feed item as read"
    put :read do
      #authenticate!

      feed_item = FeedItem.find(params[:id])
      feed_item.read = true
      feed_item.save

      status(200)
    end

    desc "Mark a feed item as unread"
    put :unread do
      #authenticate!

      feed_item = FeedItem.find(params[:id])
      feed_item.read = false
      feed_item.save

      status(200)
    end

    desc "Star a feed item"
    put :star do
      #authenticate!

      feed_item = FeedItem.find(params[:id])
      feed_item.starred = true
      feed_item.save

      status(200)
    end

    desc "Un-star a feed item"
    put :unstar do
      #authenticate!

      feed_item = FeedItem.find(params[:id])
      feed_item.starred = false
      feed_item.save

      status(200)
    end

  end
end