module StudentsHelper
    def get_category(quiz_result)
        counts = {"Contributor" => quiz_result.contributor,
                  "Collaborator" => quiz_result.collaborator,
                  "Challenger" => quiz_result.challenger,
                  "Communicator" => quiz_result.communicator}
        counts.key(counts.values.max)
    end
end
