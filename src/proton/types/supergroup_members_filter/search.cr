# This is an auto generated file. If something isn't working
# correctly, see 'typegen.cr' in the project root


module Proton::Types
  # Used to search for supergroup or channel members via a (string) query.
  class SupergroupMembersFilter::Search < Types::SupergroupMembersFilter
    include JSON::Serializable

    # Query to search for
    property query : ::String

    def initialize(@query : ::String)
    end
  end
end
