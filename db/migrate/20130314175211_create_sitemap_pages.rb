class CreateSitemapPages < ActiveRecord::Migration
  def change
    create_table :sitemap_pages do |t|
      t.text          :url
      t.timestamps
    end
  end
end
