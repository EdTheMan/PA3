class Maze
 
 attr_accessor :maze_as_string
 
  def initialize(n,m)
    
    @maze_as_string = Array.new (n) { Array.new (m) }
    @n = n
    @m = m
    
  end
 
  def load (arg)
    
    @maze_as_string = arg.split("").each_slice(@n).to_a
     
  end
  
  def display
    
    @maze_as_string.each do |key|
      
      key.each do |key2|
      print key2
      end
      
      puts 
      
    end
    
    
  end
  
end


test = Maze.new(9,9)
test.load("111111111100010001111010101100010101101110101100000101111011101100000101111111111")
#p test.maze_as_string
test.display