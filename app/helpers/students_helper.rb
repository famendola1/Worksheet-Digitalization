module StudentsHelper
    def get_category(quiz_result)
        counts = {"Contributor" => quiz_result.contributor,
                  "Collaborator" => quiz_result.collaborator,
                  "Challenger" => quiz_result.challenger,
                  "Communicator" => quiz_result.communicator}
        counts.key(counts.values.max)
    end

    def get_description(category)
    	if category == "Contributor"
    		return "Based on your last quiz result, you are a Contributor.
    		Which means that you get your team to focus on the immediate task."
    	elsif category == "Collaborator"
    		return "Based on your last quiz result, you are a Collaborator.
    		Whoch means that you emphasize the overall purpose of the team."
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
end
