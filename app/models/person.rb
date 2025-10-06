class Person
  include ActiveModel::Attributes
  include ActiveModel::AttributeAssignment

  attribute :name, :string
  attribute :date_of_birth, :date
  attribute :active, :boolean, default: true

  attr_accessor :name, :date_of_birth, :active
end
