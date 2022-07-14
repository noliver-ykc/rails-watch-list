class ChangeGenreDataType < ActiveRecord::Migration[6.1]
  def change
    change_column(:movies, :genre, :string)
  end
end
