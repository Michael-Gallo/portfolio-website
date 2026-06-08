class BlogController < ApplicationController
  rescue_from BlogRepository::InvalidPost, with: :render_invalid_post

  def index
    @posts = BlogRepository.all
  end

  def show
    @post = BlogRepository.find(params[:slug])
    render file: Rails.public_path.join("404.html"), layout: false, status: :not_found unless @post
  end

  def feed
    @posts = BlogRepository.all
  end

  private

  def render_invalid_post(error)
    Rails.logger.error(error.message)
    render plain: "Blog content is misconfigured.", status: :internal_server_error
  end
end
