# frozen_string_literal: true

module PeopleParser
  module Parsers
    class PeopleByDollar
      def initialize(input:)
        @input = input
      end

      def call
        result = []
        CSV.parse(input, :headers => true, :col_sep => ' $ ') do |row|
          city = city_name(city: row['city'])
          result << Person.new(first_name: row['first_name'], city: city, birthdate: row['birthdate']).serialize
        end
        result
      end

      private

      attr_reader :input

      def city_name(city:)
        {
          LA: 'Los Angeles',
          NYC: 'New York City',
        }[city.to_sym]
      end
    end
  end
end
