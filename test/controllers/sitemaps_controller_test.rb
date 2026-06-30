require "test_helper"

class SitemapsControllerTest < ActionDispatch::IntegrationTest
  test "sitemap includes home blog and posts" do
    get sitemap_path

    assert_response :success
    assert_equal "application/xml", response.media_type
    assert_includes response.body, root_url
    assert_includes response.body, blog_url
    assert_includes response.body, blog_post_url("why-leave-proton")
  end
end
