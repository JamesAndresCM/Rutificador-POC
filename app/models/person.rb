# frozen_string_literal: true

# model person
class Person < ApplicationRecord
  scope :exclude_params, -> { select(attribute_names - %w[created_at updated_at]) }
  scope :by_rut, ->(rut) { where(rut: rut) }
  scope :by_complete_name, lambda { |first_name, paternal, maternal|
    where('first_name ilike ? and paternal ilike ? and maternal ilike ?',
          "%#{first_name}%", "%#{paternal}%", "%#{maternal}%")
  }
end
