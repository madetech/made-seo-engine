module Seo
  class SeoController < Seo::ApplicationController
    layout 'application'

    def sitemap
      if request.format == "html"
        @sitemap_pages = SitemapPage.get_nested()
      else
        @sitemap_pages = SitemapPage.all()
      end

      respond_to do |format|
        format.html
        format.xml
      end
    end
  end
end
