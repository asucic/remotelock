require_relative 'services/people_parser/entry_point'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    @movie_showtime = PeopleParser::EntryPoint.new(
      order: params[:order],
      dollar_format: params[:dollar_format],
      percent_format: params[:percent_format],
    ).call
  end

  private

  attr_reader :params
end
