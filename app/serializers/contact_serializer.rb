class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :address, :date_of_birth
end
