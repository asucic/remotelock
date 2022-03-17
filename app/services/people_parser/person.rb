# frozen_string_literal: true

module PeopleParser
  class Person
    def initialize(city:, first_name:, birthdate:)
      @first_name = first_name
      @city = city
      @birthdate = birthdate
    end

    def serialize
      {
        first_name: first_name,
        city: city,
        birthdate: parse_date,
      }
    end

    private

    attr_reader :first_name, :city, :birthdate

    def parse_date
      Date.parse(birthdate).strftime('%-m/%-d/%Y')
    end
  end
end
