# The Image Class
class Image
  def display_image
  end
end

# On System A
class RealImage < Image
  @filename = nil

  def initialize(filename)
    @filename = filename
    load_image_from_disk
  end

  def load_image_from_disk
    puts "Loading #{@filename}"
  end

  def display_image
    puts "Displaying #{@filename}"
  end
end

# On System B
class ProxyImage < Image
  @image = nil
  @filename = nil

  def initialize(filename)
    @filename = filename
  end

  def display_image
    @image = RealImage.new(@filename) if @image.nil?
    @image.display_image
  end
end

image_1 = ProxyImage.new('HiRes_10MB_Photo1')
image_2 = ProxyImage.new('HiRes_10MB_Photo2')

image_1.display_image
image_1.display_image
image_2.display_image
image_2.display_image
image_1.display_image
