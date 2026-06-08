require "date"
require "kramdown"
require "yaml"

class BlogRepository
  POSTS_PATH = Rails.root.join("content/posts")
  FRONTMATTER_PATTERN = /\A---\s*\n(.*?)\n---\s*\n(.*)\z/m

  class InvalidPost < StandardError; end

  class << self
    def all
      Dir.glob(POSTS_PATH.join("*.md")).map { |path| parse(path) }.sort_by(&:published_on).reverse
    end

    def find(slug)
      all.find { |post| post.slug == slug }
    end

    private

    def parse(path)
      contents = File.read(path)
      match = contents.match(FRONTMATTER_PATTERN)
      raise InvalidPost, "#{path} is missing YAML frontmatter" unless match

      frontmatter = YAML.safe_load(match[1], permitted_classes: [ Date ], aliases: false) || {}
      body = match[2].strip
      slug = frontmatter.fetch("slug", File.basename(path, ".md")).to_s

      BlogPost.new(
        title: required(frontmatter, "title", path),
        date: parse_date(required(frontmatter, "date", path), path),
        slug: slug,
        description: required(frontmatter, "description", path),
        tags: Array(frontmatter["tags"]),
        body: body,
        html: Kramdown::Document.new(body, input: "kramdown").to_html
      )
    rescue Psych::SyntaxError => e
      raise InvalidPost, "#{path} has invalid YAML frontmatter: #{e.message}"
    end

    def required(frontmatter, key, path)
      value = frontmatter[key]
      return value if value.present?

      raise InvalidPost, "#{path} is missing required frontmatter field: #{key}"
    end

    def parse_date(value, path)
      value.is_a?(Date) ? value : Date.iso8601(value.to_s)
    rescue Date::Error
      raise InvalidPost, "#{path} has invalid date: #{value.inspect}"
    end
  end
end
