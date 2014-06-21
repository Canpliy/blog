class StaticPagesController < ApplicationController
  def index
    @resources = Article.all + FilmReview.all + Music.all

    @resources.sort_by! { |r| r.created_at }
    @resources.reverse!
  end

  def about
  end
end
