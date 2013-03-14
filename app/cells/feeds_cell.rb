class FeedsCell < Cell::Rails

  def sidebar
    @feeds = Feed.all
    render
  end

end
