class ChangeCookTimeType < ActiveRecord::Migration
  def change
    change_colum :recipes, :cook_time, :string
  end
end
