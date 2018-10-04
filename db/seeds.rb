require_relative("../models/student.rb")
require("pry")

Student.delete_all()

student1 = Student.new({
  "f_name" => "Harry",
  "l_name" => "Potter",
  "house" => "Gryffindor",
  "age" => 13
  })

student2 = Student.new({
  "f_name" => "Draco",
  "l_name" => "Malfoy",
  "house" => "Slytherin",
  "age" => 14
  })

student3 = Student.new({
  "f_name" => "Newt",
  "l_name" => "Scamander",
  "house" => "Ravenclaw",
  "age" => 17
  })

student4 = Student.new({
  "f_name" => "blah",
  "l_name" => "granger",
  "house" => "a house",
  "age" => 32
  })

  student1.save()
  student2.save()
  binding.pry
  student3.save()
  student4.save()

  student3.house = "Hufflepuff"
  student3.update()

  p Student.all()
  #p Student.find(27)
  student4.delete()

  return "I CAN'T SPELL GRYFFINDOR!!!!!"
