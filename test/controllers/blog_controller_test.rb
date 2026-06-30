require "test_helper"

class BlogControllerTest < ActionDispatch::IntegrationTest
  test "index lists markdown posts" do
    get blog_path

    assert_response :success
    assert_select "h1 a", "Why I left Proton"
    assert_select "a[href='#{blog_post_path("why-leave-proton")}']", "Read post"
    assert_select "a[href='#{root_path}']", "Back to portfolio"
  end

  test "show renders a markdown post" do
    get blog_post_path("why-leave-proton")

    assert_response :success
    assert_select "h1", "Why I left Proton"
    assert_select ".blog-post-body p", /switched to ProtonMail/
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
    assert_includes response.body, "Why I left Proton"
  end
end
