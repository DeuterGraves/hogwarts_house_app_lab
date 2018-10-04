require("sinatra")
require("sinatra/contrib/all")
require("pry")
require_relative("./models/student.rb")
also_reload("./models/*")


# INDEX
get ('/students') do
  @students = Student.all()
  erb(:index)
end

# NEW
get ("/students/new") do
  erb(:new)
end

# CREATE
post ("/students") do
  @student = Student.new(params)
  @student.save()
  # have to redirect to the view to go back to 'index' - if you erb(:index), you'll get an error but the student is saved.
  redirect to '/students'
end

#SHOW
get("/students/:id") do
  id = params[:id].to_i()
  @student = Student.find(id)
  erb(:show)
end
