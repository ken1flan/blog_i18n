class PhoneFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    return if value =~ /\A0[1-9][0-9]{8,9}\Z/i

    record.errors[attribute] << (options[:message] || 'is invalid phone number format')
  end
end
