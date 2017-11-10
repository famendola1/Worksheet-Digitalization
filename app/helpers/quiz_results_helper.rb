module QuizResultsHelper
    def calculate_score(quiz_result)
        category = ["Contributer","Collaborator","Communicator","Challenger"]
        counts = { "Collaborator" => 0, "Contributer" => 0, "Challenger" => 0, "Communicator" => 0 }
        
        offset = 0
        quiz_result.answers.order("question ASC").each do |a|
            counts[category[(0 + offset) % 4]] += a.responseA
            counts[category[(1 + offset) % 4]] += a.responseB
            counts[category[(2 + offset) % 4]] += a.responseC
            counts[category[(3 + offset) % 4]] += a.responseD
            offset += 1
        end
        counts
    end

    def get_contributor_description()
        return "This member gets the team to focus on the immediate task."
    end

    def get_collaborator_description()
        return "This team player emphasizes the overall purpose of the team."
    end

    def get_communicator_description()
        return "This member encourages positive interpersonal relations and group processes."
    end

    def get_challenger_description()
        return "This style asks the tough questions and pushes the team to take reasonable risks."
    end
end
