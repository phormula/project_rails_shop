class CreateWikiDict < ActiveRecord::Migration[6.0]
  def change
    create_table :wiki_dicts do |t|
      t.string :lang
      t.string :word
      t.string :part_of_speech
      t.text :meaning
    end
  end
end
