require("sinatra")
require("sinatra/contrib/all")
require("pry")
require_relative("./models/student.rb")
also_reload("./models/*")


# INDES
get ('/hogwarts') do
  @students = Student.all()
  erb(:index)
end

# NEW
get ("/hogwarts/new") do
  erb(:new)
end
