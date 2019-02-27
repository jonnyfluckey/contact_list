class ChangeNameToFirstName < ActiveRecord::Migration[5.2]
  def change
                #table name, column, change column name to
    rename_column :contacts, :name, :first_name
  end
end
