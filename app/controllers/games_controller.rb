# frozen_string_literal: true

require 'open-uri'
require 'JSON'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score; end

  def true_check?
    @word = params[:name]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    json = open(url).read
    objs = JSON.parse(json)
    objs.each do |obj|
      @word == obj['found']
    end
  end
end
