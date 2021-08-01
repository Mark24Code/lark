Class.new(Sequel::Migration) do
  def up
    puts ">>>>>>01 create_articles"
    create_table(:article) do
      primary_key :id
      String :title
      String :author
    end
  end

  def down
    drop_table :article
  end
end
