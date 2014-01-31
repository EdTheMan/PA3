class Maze
 
 attr_accessor :maze_as_string
 
  def initialize(n,m)
    
    @maze_as_string = Array.new
    
    
  end
 
  def load (arg)
    
    @maze_as_string = arg.split("")
    
    
  end
end


test = Maze.new(2,3)
test.load("111111111100010001111010101100010101101110101100000101111011101100000101111111111")
p test.maze_as_string