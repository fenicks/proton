# This is an auto generated file. If something isn't working
# correctly, see 'typegen.cr' in the project root


module Proton::Types
  # A strike-through rich text.
  class RichText::Strikethrough < Types::RichText
    include JSON::Serializable

    # Text
    property text : Proton::Types::RichText

    def initialize(@text : Proton::Types::RichText)
    end
  end
end
