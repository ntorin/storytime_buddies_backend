class UserSerializer < ActiveModel::Serializer

  attributes :id, :email, :name, :role, :sign_in_count, :current_sign_in_at, :created_at, :updated_at
end