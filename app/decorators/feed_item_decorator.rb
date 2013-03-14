class FeedItemDecorator < Draper::Decorator
  delegate_all

  def date
    model.published_date.strftime("%H:%M %p")
  end

  def summary(length = 500)
    content = model.summary || model.content || ""
    summary = h.truncate content,
                     :length => length,
                     :omission => "..."
    summary += " " + h.link_to(I18n.t(:read_more), model.url)
    h.raw summary
  end

end
