class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :image_url, :shelf_id
end
