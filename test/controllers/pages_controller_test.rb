require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "home renders the migrated portfolio" do
    get root_path

    assert_response :success
    assert_select "h1", count: 0
    assert_select ".h2.title", "Michael Anthony Gallo"
    assert_select "a[href='/blog']", "Blog"
    assert_select "#contact", count: 0
    assert_select "a", text: "Contact", count: 0
  end
end
