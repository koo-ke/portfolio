class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string      :apptitle
      t.text        :text
      t.text        :image
      t.text        :github

      t.timestamps
    end
  end
end
