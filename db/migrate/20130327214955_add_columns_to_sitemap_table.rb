class AddColumnsToSitemapTable < ActiveRecord::Migration
  def change
    add_column :seo_sitemap_pages, :changefreq, :string, :default => "monthly"
    add_column :seo_sitemap_pages, :priority, :string, :default => "1"
  end
end
