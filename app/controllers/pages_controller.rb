class PagesController < ApplicationController
  def home
    @skills = HomePageContent.skills
    @portfolio_items = HomePageContent.portfolio_items
    @experiences = HomePageContent.experiences
  end
end
