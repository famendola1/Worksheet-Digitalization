module StudentsHelper
    def get_category(quiz_result)
        counts = {"Contributor" => quiz_result.contributor,
                  "Collaborator" => quiz_result.collaborator,
                  "Challenger" => quiz_result.challenger,
                  "Communicator" => quiz_result.communicator}
        counts.key(counts.values.max)
    end

    def get_description(category)
    	if category == "Contributer"
    		return "Based on your last quiz result, you are a Contributor.
    		Which means that you get your team to focus on the immediate task."
    	elsif category == "Collaborator"
    		return "Based on your last quiz result, you are a Collaborator.
    		Which means that you emphasize the overall purpose of the team."
    	elsif category == "Challenger"
    		return "Based on your last quiz result, you are a Challenger. 
    		Which means that you ask tough questions and push your team to
    		take reasonable risks."
    	elsif category == "Communicator"
    		return "Based on your last quiz result, you are a Communicator.
    		Which means that you encourage positive interpersonal realations 
    		and group processes."
    	end
    end

    def get_error_message(student_params)
        if Student.exists?(:student_id => student_params[:student_id]) #Tell user the corresponding name
            id = student_params[:student_id]
            student = Student.find_by(:student_id => student_params[:student_id])
            name = student.name
            error = "There already exists a student with id, " + id.to_s + ". " + name + " corresponds to that id. Please input the student with correct name and id to add to course."
        else #Name is already taken
            name = student_params[:name]
            error = "There already exists a student with the name, " + name +". Change name of student to be able to add to course."
        end
        return error
    end

    def check_id_and_name(student_params)
        student1 = Student.find_by(:student_id => student_params[:student_id])
        student2 = Student.find_by(:name => student_params[:name])
        return student1 != student2
    end
end
