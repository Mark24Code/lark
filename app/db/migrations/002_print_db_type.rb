Class.new(Sequel::Migration) do
  def up
    puts ">>>>>>01 create_articles"
    create_table(:user) do
      primary_key :id
      String :name
      String :address
    end
  end

  def down
    drop_table :user
  end
end
