class FeedItemDecorator < Draper::Decorator
  delegate_all

  def date
    model.published_date.strftime("%H:%M %p")
  end

  def summary(length = 500)
    summary = h.truncate model.summary,
                     :length => length,
                     :omission => "..."
    summary += " " + h.link_to(I18n.t(:read_more), model.url)
    h.raw summary
  end

end
