# This is an auto generated file. If something isn't working
# correctly, see 'typegen.cr' in the project root


module Proton::Types
  # Applies if a user chooses some previously saved payment credentials.
  # To use their previously saved credentials, the user must have a valid temporary password.
  class InputCredentials::Saved < Types::InputCredentials
    include JSON::Serializable

    # Identifier of the saved credentials
    property saved_credentials_id : ::String

    def initialize(@saved_credentials_id : ::String)
    end
  end
end
