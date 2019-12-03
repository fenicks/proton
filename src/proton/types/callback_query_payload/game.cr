# This is an auto generated file. If something isn't working
# correctly, see 'typegen.cr' in the project root


module Proton::Types
  # The payload from a game callback button.
  class CallbackQueryPayload::Game < Types::CallbackQueryPayload
    include JSON::Serializable

    # A short name of the game that was attached to the callback button
    property game_short_name : ::String

    def initialize(@game_short_name : ::String)
    end
  end
end
