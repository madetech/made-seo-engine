class RenameParentToParentUrlSeoSitemapPages < ActiveRecord::Migration
  def change
    rename_column :seo_sitemap_pages, :parent, :parent_url
    change_column :seo_sitemap_pages, :url, :string
  end
end
