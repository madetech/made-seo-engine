class RenameSitemapTable < ActiveRecord::Migration
  def change
    rename_table :sitemap_pages, :seo_sitemap_pages
  end
end
