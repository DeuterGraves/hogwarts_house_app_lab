require_relative("../db/sql_runner.rb")

class Students:

attr_reader :id
attr_accessor :f_name, :l_name, :house, :age


  def initialize(options)
    @id = options['id'].to_i
    @f_name = options['f_name']
    @l_name = options['l_name']
    @house  = options['house']
    @age = options['age'].to_i
  end









end
