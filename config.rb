require 'ostruct'
require 'pry'
require 'kramdown'

###
# Page options, layouts, aliases and proxies
###


# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

page 'today.html'
page 'sponsorship.html'
page 'code-of-conduct.html'

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

helpers do
  def mailing_list_url
    "//eriedayofcode.us10.list-manage.com/subscribe/post" \
      "?u=3fcd98d64025f034a082fe384&id=bb907d9e18"
  end

  def cfp_url
    'https://goo.gl/forms/iObfuLgTJOwl8ovm2'
  end

  def tickets_url
    "https://eriedayofcode.ticketleap.com/2017/dates/Jun-16-2017_at_0845AM"
  end

  def social_links
    OpenStruct.new(
      twitter: data.info.twitter_url,
      facebook: data.info.facebook_url
    )
  end

  def venue
    OpenStruct.new(
      name: 'Erie Art Museum',
      url: 'http://erieartmuseum.org',
      street: '411 State St.',
      address_line: 'Erie, PA 16501',
    )
  end

  def close_lodging
    data.lodging.select { |place| place.proximity == 'close' }
  end

  def further_lodging
    data.lodging.select { |place| place.proximity == 'far' }
  end

  def md_text(text)
    Kramdown::Document.new(text).to_html
  end
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
