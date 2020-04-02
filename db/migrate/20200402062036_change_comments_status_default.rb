class ChangeCommentsStatusDefault < ActiveRecord::Migration
  def change
  	change_column_default :comments,:status, false
  end
end
