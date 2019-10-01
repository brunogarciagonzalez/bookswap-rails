class UserSerializer < ApplicationController

    attr_reader :data

    def initialize(data)
        @data = data
    end

    def to_serialized_json
        # serialize our data that's passed in
        # to_json is a built in a method that will convert our data to json
        self.data.to_json(only: [:id, :username])
    end

end