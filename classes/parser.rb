file = File.open("classes/compsci", "rb")
content = file.read
courses = content.split("\n\n")
for course in courses
	key_content = course.split("\n")[0]
	department = key_content.split(" ")[0]
	course_number = key_content.split(" ")[1]
	course_name = ""
	for i in key_content.split(" ")[2...key_content.split(" ").count]
		if (!!(i =~ /\A[-+]?[0-9]+\z/))
			break
		elsif i == nil

		else
			course_name = course_name + " " + i 
		end
	end
	Course.create({:name=>course_name,:course_no=>course_number,:department=>department})
end