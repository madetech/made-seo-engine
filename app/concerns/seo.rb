require 'active_record'
require 'active_support/concern'

module Seo
  module SeoConcerns
    extend ActiveSupport::Concern

    included do
      attr_accessible                 :meta,
                                      :meta_attributes
    end
  end

  module Sitemappable
    extend ActiveSupport::Concern

    included do
      after_save :save_sitemap_url
      before_destroy :delete_sitemap_url

      def save_sitemap_url
        sitemap = SitemapPage.find_or_create_by_url(self.get_canonical_url)
      end

      def delete_sitemap_url
        target = SitemapPage.where("url = ?", self.get_canonical_url).first.delete
      end
    end
  end
end
