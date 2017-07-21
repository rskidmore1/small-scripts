#!/usr/bin/env ruby 

require 'rmagick'
require 'date'
require 'net/http'
require 'uri'
require './books'

def lineplace(input) #only works on jpgs 
  input = input

  scale(input, input) 

  randnum = Random.rand(1000..2000)
  num = Random.rand(0...65)
  uri = URI.parse('http://labs.bible.org/api/?passage=' + Stuff::BOOKS[num] + '3:16')
  printuri = Net::HTTP.get(uri)

 
  old_pos = randnum 
  File.open(input, 'r+') do |f|
    f.pos = old_pos
    f.print printuri
  end

  
end
