class UserSerializer < ApplicationController

    attr_reader :data

    def initialize(data)
        @data = data
    end

    def to_serialized_json
        self.data.to_json(only: [:id, :username])
    end

end