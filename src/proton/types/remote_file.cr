# This is an auto generated file. If something isn't working
# correctly, see 'typegen.cr' in the project root

require "./base"

module Proton::Types
  # Represents a remote file.
  class RemoteFile < Types::Base
    include JSON::Serializable

    # True, if the file is currently being uploaded (or a remote copy is being generated by some other means)
    property is_uploading_active : ::Bool

    # True, if a remote copy is fully available
    property is_uploading_completed : ::Bool

    # Size of the remote available part of the file; 0 if unknown
    property uploaded_size : ::Int32

    # Remote file identifier; may be empty. Can be used across application restarts or even from other devices for the current user. If the ID starts with "http://" or "https://", it represents the HTTP URL of the file. TDLib is currently unable to download files if only their URL is known. If downloadFile is called on such a file or if it is sent to a secret chat, TDLib starts a file generation process by sending updateFileGenerationStart to the client with the HTTP URL in the original_path and "#url#" as the conversion string. Clients should generate the file by downloading it to the specified location
    property id : ::String? = nil

    def initialize(@is_uploading_active : ::Bool, @is_uploading_completed : ::Bool, @uploaded_size : ::Int32, @id : ::String? = nil)
    end
  end
end
