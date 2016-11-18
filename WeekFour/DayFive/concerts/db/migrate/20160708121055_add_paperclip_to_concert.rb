class AddPaperclipToConcert < ActiveRecord::Migration
  def change
    add_attachment :concerts, :image  
  end
end
