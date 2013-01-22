class PagesController < ApplicationController
  def home
    @event_datum = EventDatum.new
  end
end
