xml.instruct! :xml, version: "1.0", encoding: "UTF-8"
xml.feed xmlns: "http://www.w3.org/2005/Atom" do
  xml.title "Michael Gallo Blog"
  xml.id blog_url
  xml.link href: blog_url
  xml.link href: feed_url(format: :atom), rel: "self", type: "application/atom+xml"
  xml.updated((@posts.first&.published_on || Date.current).to_time.utc.iso8601)

  @posts.each do |post|
    xml.entry do
      xml.title post.title
      xml.id blog_post_url(post.slug)
      xml.link href: blog_post_url(post.slug)
      xml.published post.published_on.to_time.utc.iso8601
      xml.updated post.published_on.to_time.utc.iso8601
      xml.summary post.description
      xml.content sanitize(post.html), type: "html"
    end
  end
end
