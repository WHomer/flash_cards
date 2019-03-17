class AdapterFromText

  def initialize
    @filename = 'cards.txt'
  end

  def read_file
    File.readlines(@filename).map do |line|
      line.chomp.split(",")
    end
  end
end
