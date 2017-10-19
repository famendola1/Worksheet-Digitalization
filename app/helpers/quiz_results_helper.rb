module QuizResultsHelper
    def calculate_score(quiz_result)
        category = ["Collaborator","Contributer","Challenger","Communicator"]
        counts = { "Collaborator" => 0, "Contributer" => 0, "Challenger" => 0, "Communicator" => 0 }
        
        offset = 0
        quiz_result.answers.order("question ASC").each do |a|
            counts[category[(0 + offset) % 4]] += a.responseA
            counts[category[(1 + offset) % 4]] += a.responseB
            counts[category[(2 + offset) % 4]] += a.responseC
            counts[category[(3 + offset) % 4]] += a.responseD
            offset += 1
        end
        counts.key(counts.values.max)
    end
    
end
