class FeedsController < ApplicationController
  before_filter :authenticate_user!

  # GET /feeds
  def index
    @feed_items = FeedItem.joins(:feed).where('feeds.user_id' => current_user.id).page(params[:page]).per(10)
  end

  # GET /feeds/1
  def show
    @feed = Feed.find(params[:id])
    @feed_items = @feed.feed_items.page(params[:page]).per(10)
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
    @feed = Feed.find(params[:id])
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
    @feed = Feed.find(params[:id])

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
    @feed = Feed.find(params[:id])
    @feed.destroy
    redirect_to feeds_url
  end
end
