# frozen_string_literal: true

module PeopleParser
  class Action
    def initialize(order:, dollar_format:, percent_format:)
      @order = order
      @dollar_format = dollar_format
      @percent_format = percent_format
    end

    def call
      result = parsers.map { |parser| parser.call }
      result = sort_by_order(result: result.flatten)
      format(result: result)
    end

    private

    attr_reader :order, :dollar_format, :percent_format

    def format(result:)
      result.map { |row| row.values.join(', ') }
    end

    def sort_by_order(result:)
      result.sort_by { |x| x[order.to_sym] }
    end

    def parsers
      [people_by_dollar, people_by_percent].flatten
    end

    def people_by_dollar
      @people_by_dollar ||= Parsers::PeopleByDollar.new(input: dollar_format)
    end

    def people_by_percent
      @people_by_percent ||= Parsers::PeopleByPercent.new(input: percent_format)
    end
  end
end
