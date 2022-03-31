# frozen_string_literal: true

class CodePegsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.length > 4
      record.errors.add(attribute, :more_than_four)
    end

    if value.length < 4
      record.errors.add(attribute, :less_than_four)
    end

    if value.any? { |peg| !Game::COLOURS.include?(peg) }
      record.errors.add(attribute, :invalid_colours)
    end
  end
end
