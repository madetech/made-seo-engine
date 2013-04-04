class AddTitleToSitemap < ActiveRecord::Migration
  def change
    add_column :seo_sitemap_pages, :title, :string
  end
end
