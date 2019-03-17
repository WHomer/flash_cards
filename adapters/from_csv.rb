require 'csv'

class AdapterFromCSV

  def initialize
    @filename = 'cards.csv'
  end

  def read_file
    CSV.read(@filename){ |line| }
  end
end
