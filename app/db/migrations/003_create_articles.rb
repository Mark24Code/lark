Class.new(Sequel::Migration) do
  def up
    puts ">>>>>> 03create_articles"
    create_table(:articles) do
      primary_key :id
      String :title
    end
  end

  def down
    drop_table :articles
  end
end
