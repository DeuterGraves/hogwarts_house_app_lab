require_relative("../db/sql_runner.rb")

class Student

attr_reader :id
attr_accessor :f_name, :l_name, :house, :age


  def initialize(options)
    @id = options['id'].to_i
    @f_name = options['f_name']
    @l_name = options['l_name']
    @house  = options['house']
    @age = options['age'].to_i
  end

  # hash_result

  def self.hash_result(data)
    student_hash = data[0]
    student = Student.new(student_hash)
  end

  # map_items

  def self.map_items(data)
    result = data.map{|student| Student.new(student) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM students
          WHERE id  = $1;"
    values = [@id]
    SqlRunner.run(sql,values)
  end



  def save()
    sql = "INSERT INTO students (
          f_name,
          l_name,
          house,
          age)
          VALUES ($1, $2, $3, $4)
          RETURNING id;"

    values = [@f_name,@l_name, @house, @age]
    result = SqlRunner.run(sql,values)
    #ok. here we go. get the only thing from the result
    result_hash = result[0]
    #now grab the data stored in 'id'
    string_id = result_hash["id"]
    # and save it to the id variable as an integer
    @id = string_id.to_i

  end

  def self.all()
    sql = "SELECT * FROM students;"
    results = SqlRunner.run(sql)
    Student.map_items(results)
  end

 def self.find(id)
 sql = "SELECT * FROM students
        WHERE id = $1;"

  values = [id]
  result = SqlRunner.run(sql,values)
  Student.hash_result(result)

 end

 def update()
    sql = "UPDATE Students
            SET (f_name, l_name, house, age) =
            ($1, $2, $3, $4)
            WHERE id = $5;"
    values = [@f_name, @l_name, @house, @age, @id]
    SqlRunner.run(sql,values)
  end


end
