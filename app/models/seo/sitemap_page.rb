module Seo
  class SitemapPage < ActiveRecord::Base
    attr_accessible         :url,
                            :parent_url,
                            :title,
                            :changefreq,
                            :priority,
                            :created_at,
                            :updated_at

    validates_presence_of   :url
    validates_uniqueness_of :url

    def self.get_nested
      get_pages_by_parent_url(nil)
    end

    private
    def self.get_pages_by_parent_url(parent_url)
      page_arr = []

      pages = SitemapPage.where(:parent_url => parent_url)
      pages.each do |page|
        page_arr << {
          :page => page,
          :children => self.get_pages_by_parent_url(page.url)
        }
      end

      page_arr
    end
  end
end
