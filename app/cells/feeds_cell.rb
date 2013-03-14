class FeedsCell < Cell::Rails
  include Devise::Controllers::Helpers

  def sidebar
    @feeds = current_user.feeds
    render
  end

end
