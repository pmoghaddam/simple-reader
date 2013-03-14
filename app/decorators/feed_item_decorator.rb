class FeedItemDecorator < Draper::Decorator
  delegate_all

  def date
    old = model.published_date < 1.day.ago
    format = (old) ? '%d/%m/%y' : "%H:%M %p"
    model.published_date.strftime(format)
  end

  def summary(length = 500)
    content = model.summary || model.content || ""
    content = h.strip_tags content

    summary = h.truncate content,
                     :length => length,
                     :omission => "..."
  end

end
