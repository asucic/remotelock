# frozen_string_literal: true

require_relative 'parsers/people_by_percent'
require_relative 'parsers/people_by_dollar'
require_relative 'action'
require_relative 'person'
require 'csv'

module PeopleParser
  class EntryPoint
    def initialize(order:, dollar_format:, percent_format:)
      @action = Action.new(
        order: order,
        dollar_format: dollar_format,
        percent_format: percent_format,
      )
    end

    def call
      action.call
    end

    private

    attr_reader :action
  end
end
