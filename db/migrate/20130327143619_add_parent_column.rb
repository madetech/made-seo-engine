class AddParentColumn < ActiveRecord::Migration
  def change
    add_column :seo_sitemap_pages, :parent, :string
  end
end
