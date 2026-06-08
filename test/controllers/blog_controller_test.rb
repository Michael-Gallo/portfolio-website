require "test_helper"

class BlogControllerTest < ActionDispatch::IntegrationTest
  test "index lists markdown posts" do
    get blog_path

    assert_response :success
    assert_select "h1 a", "Hello, Rails Blog"
    assert_select "a[href='#{blog_post_path("hello-rails-blog")}']", "Read post"
    assert_select "a[href='#{root_path}']", "Back to portfolio"
  end

  test "show renders a markdown post" do
    get blog_post_path("hello-rails-blog")

    assert_response :success
    assert_select "h1", "Hello, Rails Blog"
    assert_select ".blog-post-body p", /first post/
    assert_select "a[href='#{root_path}']", "Back to portfolio"
  end

  test "missing post returns not found" do
    get blog_post_path("missing-post")

    assert_response :not_found
  end

  test "feed renders atom" do
    get feed_path

    assert_response :success
    assert_equal "application/atom+xml", response.media_type
    assert_includes response.body, "Hello, Rails Blog"
  end
end
