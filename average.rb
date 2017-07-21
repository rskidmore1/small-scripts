#! /usr/bin/env ruby 

require 'pnglitch'

def sub(input, output) #side scan lines

  input = input 
  output = output 

  PNGlitch.open(input) do |png|
    png.each_scanline do |scanline|
      scanline.change_filter 1
    end
    png.glitch do |data|
      data.gsub /\d/, 'x'
    end
    png.save output  
  end

  
end

def up(input, output) #up down scan lines 


  input = input
  output = output

  PNGlitch.open(input) do |png|
    png.each_scanline do |scanline|
      scanline.change_filter 2
    end
    png.glitch do |data|
      data.gsub /\d/, 'x'
    end
    png.save output
  end
 
end 


def average(input, output) #diagonal scanlines 

  input = input
  output = output

  PNGlitch.open(input) do |png|
    png.each_scanline do |scanline|
      scanline.change_filter 3
    end
    png.glitch do |data|
      data.gsub /\d/, 'x'
    end
    png.save output
  end

end

def paeth(input, output) # normal glitch


  input = input
  output = output

  PNGlitch.open(input) do |png|
    png.each_scanline do |scanline|
      scanline.change_filter 4
    end
    png.glitch do |data|
      data.gsub /\d/, 'x'
    end
    png.save output
  end

end 
