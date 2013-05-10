class AddCanonicalUrlToSeoMeta < ActiveRecord::Migration
  def change
    add_column :seo_meta, :canonical_url, :string
  end
end
