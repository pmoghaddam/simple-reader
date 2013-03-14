class FeedsController < ApplicationController
  before_filter :authenticate_user!

  # GET /feeds
  def index
    @feed_items = FeedQuery.new(current_user).feed_items().page(params[:page]).per(25).decorate
  end

  def starred
    @feed_items = FeedQuery.new(current_user).starred_items().page(params[:page]).per(25).decorate
    render 'index'
  end

  # GET /feeds/1
  def show
    @feed = current_user.feeds.find(params[:id])
    @feed_items = @feed.feed_items.page(params[:page]).per(25).decorate
  end

  # POST /feeds
  def create
    service = FeedService.new
    options = {}
    begin
      @feed = service.add_and_fetch(params[:url], current_user)
      options[:notice] = 'Feed was successfully created.'
    rescue Exception
      options[:alert]  = "Unable to add Feed: #{params[:url]}"
    end


    respond_to do |format|
      if @feed.try(:save)
        format.html { redirect_to @feed, options }
      else
        format.html { redirect_to feeds_url, options }
      end
    end
  end

  # DELETE /feeds/1
  def destroy
    @feed = current_user.feeds.find(params[:id])
    @feed.destroy
    redirect_to feeds_url
  end

  def refresh
    service = FeedService.new
    service.refresh(current_user)

    flash[:notice] = 'Feeds have been successfully updated'
    redirect_to feeds_url
  end

  def mark_all_as_read
    FeedQuery.new(current_user).feed_items().update_all({:read => true})
    redirect_to feeds_url
  end

end
