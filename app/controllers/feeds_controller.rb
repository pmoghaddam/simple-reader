class FeedsController < ApplicationController
  before_filter :authenticate_user!

  # GET /feeds
  def index
    @feed_items = FeedItem.joins(:feed).where('feeds.user_id' => current_user.id).page(params[:page]).per(10)
  end

  # GET /feeds/1
  def show
    @feed = current_user.feeds.find(params[:id])
    @feed_items = @feed.feed_items.page(params[:page]).per(10)
  end

  # POST /feeds
  def create
    service = FeedService.new
    @feed = service.add_and_fetch(params[:url], current_user)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /feeds/1
  def update
    @feed = current_user.feeds.find(params[:id])

    respond_to do |format|
      if @feed.update_attributes(params[:feeds])
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
      else
        format.html { render action: "edit" }
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
    redirect_to feeds_url
  end

end
