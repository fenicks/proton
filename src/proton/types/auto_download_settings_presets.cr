# This is an auto generated file. If something isn't working
# correctly, see 'typegen.cr' in the project root

require "./base"

module Proton::Types
  # Contains auto-download settings presets for the user.
  class AutoDownloadSettingsPresets < Types::Base
    include JSON::Serializable

    # Preset with lowest settings; supposed to be used by default when roaming
    property low : Proton::Types::AutoDownloadSettings

    # Preset with medium settings; supposed to be used by default when using mobile data
    property medium : Proton::Types::AutoDownloadSettings

    # Preset with highest settings; supposed to be used by default when connected on Wi-Fi
    property high : Proton::Types::AutoDownloadSettings

    def initialize(@low : Proton::Types::AutoDownloadSettings, @medium : Proton::Types::AutoDownloadSettings, @high : Proton::Types::AutoDownloadSettings)
    end
  end
end
