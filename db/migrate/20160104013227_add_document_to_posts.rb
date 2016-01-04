class AddDocumentToPosts < ActiveRecord::Migration
  def change
    add_attachment :posts, :document
  end
end
