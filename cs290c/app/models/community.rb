class CommunityValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:name] << "needs at least four letters" unless record.name.length >= 4
  end
end

class Community < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with CommunityValidator
  validates :name, presence: true, uniqueness: true
  # one way to validate at least four letters
  # validates :name, presence: true, uniqueness: true, format: { with: /.....*/, message: "Must contain at least four letters" }
end
