#! usr/bin/env ruby

require 'rmagick'
require 'date'
require 'net/http'
require 'uri'
require './books'

public
def scale(input, output)

  input = input
  output = output


  size = Magick::Image.ping(input).first
  width = size.columns
  height = size.rows
  ratio = width.to_f / height.to_f


  image = Magick::Image.read(input).first
  thumb = image.scale( 1000 * ratio, 1000 )

  thumb.write(output)

end





public
def resizebg(input)

  input = input
  output = output


  size = Magick::Image.ping(input).first
  width = size.columns
  height = size.rows
  ratio = height.to_f / width.to_f 

  image = Magick::Image.read(input).first
  thumb = image.scale( 1600, 1600 * ratio)
  thumb.write(input)

end

public 
def cropbg(input, output)

  input = input 
  output = output 

  image2 = Magick::Image.read(input).first
  thumb2 = image2.resize_to_fill(1600, 1000)
  thumb2.write(output)

end 

public 
def bg(input, output)
  
  input = input 
  output = output 

  #resize
  resizebg(input)
  
  #crop  
  cropbg(input, output) 
  
end

 
public
def resizeph(input)

  input = input
  output = output


  size = Magick::Image.ping(input).first
  width = size.columns
  height = size.rows
  ratio = height.to_f / width.to_f

  image = Magick::Image.read(input).first
  thumb = image.scale( 600, 600 * ratio)
  thumb.write(input)

end


public
def cropph(input, output)

  input = input
  output = output

  image2 = Magick::Image.read(input).first
  thumb2 = image2.resize_to_fill(600, 1000)
  thumb2.write(output)

end

public
def ph(input, output)

  input = input
  output = output

  #resize
  resizeph(input)

  #crop  
  cropph(input, output)

end



#class Effect ##restore this when ready to make script into command line util. Don't forget "end" down below

                
def poster(input, output)
 
  input = input 
  output = output 
 
  scale(input, output)

  #Demonstrate the Image#polaroid method
  img = Magick::Image.read(output).first
  result = img.posterize
  
  #Write 
  result.write(output)

end 


def earthpitch(input, output)
#Uses rmagick's segment feature
#see https://rmagick.github.io/ for documentation
# Demonstrate the Image#segment method. (this is from rmagick
  input = input 
  output = output 

  scale(input, output)

 # convert(input, output)
 
  
  img = Magick::Image.read(output).first
  img = img.segment(Magick::SRGBColorspace, 0.4, 0.4)
  img.write(output)

end

def blur(input, output)
  input = input 
  output = output 

  scale(input, output)
 # convert(input, output)
  img = Magick::Image.read(output).first
  img = img.blur_image(0, 1)
  img.write(output + '.png')
end
 


def eightbit(input, output)
  input = input
  output = output
  

   
  #read image size and makes ratio 
  size = Magick::Image.ping( input ).first
  width = size.columns 
  height = size.rows 
  ratio = width.to_f / height.to_f  
  
 
  # Demonstrate the Image#polaroid method
  img = Magick::Image.read(input).first
  result = img.posterize
  result.write(output)

  #Does scaling 
  #Scales down
  image = Magick::Image.read(output).first
  thumb = image.scale( 30 * ratio, 30 )
  thumb.write(output)

  #Scales up 
  image = Magick::Image.read(output).first
  thumb = image.scale( 300 * ratio, 300 )

  thumb.write(output)

end  

#end 
