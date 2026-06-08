class SitemapsController < ApplicationController
  def show
    @posts = BlogRepository.all
  end
end
