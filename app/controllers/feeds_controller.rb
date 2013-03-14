class FeedsController < ApplicationController
  before_filter :authenticate_user!

  # GET /feeds
  def index
    @feed_items = FeedQuery.new(current_user).feed_items().page(params[:page]).per(25).decorate
  end

  # GET /feeds/1
  def show
    @feed = current_user.feeds.find(params[:id])
    @feed_items = @feed.feed_items.page(params[:page]).per(25).decorate
  end

  # POST /feeds
  def create
    service = FeedService.new
    @feed = service.add_and_fetch(params[:url], current_user)
    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
      else
        format.html { redirect_to feeds_url}
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
