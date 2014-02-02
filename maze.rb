require_relative 'node.rb'
require_relative 'point.rb'

class Maze
 
 attr_accessor :maze_as_string
 
  def initialize(n,m)
    
    @maze = Array.new (n) { Array.new (m) }
    @n = n
    @m = m
    @node = Struct.new(:parent, :value)
    @point = Struct.new(:x, :y)
    
  end
 
  def load (arg)
    
    @maze = arg.split("").each_slice(@n).to_a 
    p @maze
     
  end
  
  def display
    
    @maze.each do |key|
      
      key.each do |key2|
      print key2
      end
      
      puts 
      
    end
    
  end
 
  def solve(begX,begY,endX,endY)
    queue = Queue.new
    initial_node = @point.new(begX,begY)
    final_node = @point.new(endX,endY)
    queue.push(initial_node)  
    while (not queue.empty?) do
    value = queue.deq
      if value == final_node 
        return value
      else
      solutions = get_solutions(value)
        solutions.each do |value2|
        queue.push(value2)
        end
      end
    end
    return "Error"
  end
  
  def trace(begX,begY,endX,endY)
    queue = Queue.new
    path = Array.new
    initial_point = @point.new(begX,begY)
    final_point = @point.new(endX,endY)
    initial_node = @node.new(@node.new(nil,@point.new(-1,-1)),initial_point)
    queue.push(initial_node)
    while (not queue.empty?) do
    value = queue.deq
      if value.value == final_point 
          track = Array.new
          track << value.value        
          a = value
          while(a.parent.value.x != -1 && a.parent.value.y != -1) do
            track << a.parent.value
            a = a.parent
          end
          track.reverse.each do |value2| 
            print value2.x
            print " "
            p value2.y
          end
          return
       else
       solutions = get_solutions(value)
         solutions.each do |value2|
         queue.push(value2)
         end
       end
    end
    p "Error"
  end
   
  
  def get_solutions(node)
    solutions = Array.new
    x = node.value.x
    y = node.value.y    
    #left
    if (x-1 >= 0) && ((x-1) != node.parent.value.x || y != node.parent.value.y) && (@maze[y][x-1] == "0") 
      solutions << @node.new(node,@point.new(x-1,y))
    end
    #top
    if (y-1 >= 0) && (x != node.parent.value.x || (y-1) != node.parent.value.y) && (@maze[y-1][x] == "0" )
      solutions << @node.new(node,@point.new(x,y-1))
    end
    #right
    if (x+1 <= (@n-1)) && ((x+1) != node.parent.value.x || y != node.parent.value.y) && (@maze[y][x+1] == "0") 
      solutions << @node.new(node,@point.new(x+1,y))
    end
    #down
    if (y+1 <= (@m-1)) && (x != node.parent.value.x || (y+1) != node.parent.value.y) && (@maze[y+1][x] == "0")
      solutions << @node.new(node,@point.new(x,y+1))
    end
    return solutions    
  end
end

  test = Maze.new(9,9)
  test.load("111111111100010001111010101100010101101110101100000101111011101100000101111111111")
  #p test.maze_as_string
  test.display
  test.trace(1,1,5,7)
  
