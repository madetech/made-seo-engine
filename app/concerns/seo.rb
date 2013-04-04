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
      after_save :save_sitemap_url, :clear_cache
      before_destroy :delete_sitemap_url
      after_destroy :clear_cache

      def save_sitemap_url
        change_freq = if defined?(self.get_change_frequency) then self.get_change_frequency else "monthly" end
        priority = if defined?(self.get_sitemap_priority) then self.get_sitemap_priority else 1 end

        sitemap = SitemapPage.find_or_initialize_by_url(:url => self.get_canonical_url)
        sitemap.update_attributes({
                    :title => self.get_sitemap_title,
                    :parent_url => self.get_parent_url,
                    :changefreq => change_freq,
                    :priority => priority
        })
      end

      def delete_sitemap_url
        SitemapPage.where(:url => self.get_canonical_url).each do |item|
          item.delete
        end
      end

      def clear_cache
        Seo.config.sitemap_sweeper.expire_cache if Seo.config.sitemap_sweeper
      end
    end
  end
end
