#!/usr/bin/env ruby
require "optparse"

MESSAGE = "I don't know any countries like that, so the world is bigger than I thought."
WIN_MESSAGE = "Japan win!"
LOSE_MESSAGE = "Japan lose..."

class WorldCup2022
  def initialize
    @games = {}
    OptionParser.new do |opt|
      opt.on("-g", "--germany", "Show the winners and losers of the match between Japan and Germany") { |val| @games[:result] = WIN_MESSAGE }
      opt.on("-c", "--costarica", "Show the winners and losers of the match between Japan and Costa Rica") { |val| @games[:result] = LOSE_MESSAGE }
      opt.parse(ARGV)
    rescue OptionParser::InvalidOption => error
      puts self.message
    end
  end

  def message
    return MESSAGE
  end

  def specify?
    return !!@games[:result]
  end

  def get_the_result
    return @games[:result]
  end
end

worldcup2022 = WorldCup2022.new
puts worldcup2022.get_the_result if worldcup2022.specify?
