# frozen_string_literal: true

module PeopleParser
  module Parsers
    class PeopleByPercent
      def initialize(input:)
        @input = input
      end

      def call
        result = []
        CSV.parse(input, :headers => true, :col_sep => " % ") do |row|
          result << Person.new(first_name: row['first_name'], city: row['city'], birthdate: row['birthdate']).serialize
        end
        result
      end

      private

      attr_reader :input
    end
  end
end
