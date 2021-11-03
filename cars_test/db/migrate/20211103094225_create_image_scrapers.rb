class CreateImageScrapers < ActiveRecord::Migration[6.1]
  def change
    create_table :image_scrapers do |t|

      t.timestamps
    end
  end
end
