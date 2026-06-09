require "test_helper"
require "tempfile"

class BlogRepositoryTest < ActiveSupport::TestCase
  test "parses markdown frontmatter into a blog post" do
    post = parse_markdown(<<~MARKDOWN)
      ---
      title: Test Post
      date: 2026-01-02
      description: A parser test.
      tags:
        - Ruby
      ---

      ## Heading

      Body text.
    MARKDOWN

    assert_equal "Test Post", post.title
    assert_equal Date.new(2026, 1, 2), post.published_on
    assert_equal [ "Ruby" ], post.tag_list
    assert_includes post.html, "<h2"
  end

  test "rewrites pasted image paths to site-root blog image urls" do
    post = parse_markdown(<<~MARKDOWN)
      ---
      title: Image Post
      date: 2026-01-02
      description: Image path rewrite test.
      ---

      ![Relative](../../public/blog-images/image-post/screenshot.png)
      ![Broken](${workspaceFolder}/public/blog-images/image-post/screenshot-2.png)
      ![Absolute](/blog-images/image-post/screenshot-3.png)
    MARKDOWN

    assert_includes post.html, 'src="/blog-images/image-post/screenshot.png"'
    assert_includes post.html, 'src="/blog-images/image-post/screenshot-2.png"'
    assert_includes post.html, 'src="/blog-images/image-post/screenshot-3.png"'
  end

  test "raises for missing required frontmatter" do
    error = assert_raises(BlogRepository::InvalidPost) do
      parse_markdown(<<~MARKDOWN)
        ---
        title: Missing Description
        date: 2026-01-02
        ---

        Body text.
      MARKDOWN
    end

    assert_match(/description/, error.message)
  end

  private

  def parse_markdown(contents)
    Tempfile.create([ "post", ".md" ]) do |file|
      file.write(contents)
      file.flush

      return BlogRepository.send(:parse, file.path)
    end
  end
end
