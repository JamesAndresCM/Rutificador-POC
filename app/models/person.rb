# frozen_string_literal: true

# model person
class Person < ApplicationRecord
  scope :exclude_params, -> { select(attribute_names - %w[created_at updated_at]) }
  scope :by_rut, ->(rut) { where(rut: rut) }
  scope :by_complete_name, proc { |first_name, paternal, maternal|
    if first_name.present? && maternal.present?
      where('first_name ilike ? and maternal ilike ?',
          "%#{first_name}%", "%#{maternal}%")
    elsif first_name.present? && paternal.present?
      where('first_name ilike ? and paternal ilike ?',
          "%#{first_name}%", "%#{paternal}%")
    elsif first_name.present? && paternal.present? && maternal.present?
      where('first_name ilike ? and paternal ilike ? and maternal ilike ?',
            "%#{first_name}%", "%#{paternal}%", "%#{maternal}%")
    end
  }
end
