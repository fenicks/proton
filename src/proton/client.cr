require "uuid"
require "promise"

require "./types/*"
require "./client_methods"

module Proton
  class Client
    include Proton::ClientMethods

    alias Event = Proc(Types::Base, Nil)

    DEFAULT_TIMEOUT = 20

    @td_client : Pointer(Void)

    @event_handlers : Hash(Types::Base.class, Array(Event))

    getter? running : Bool

    property timeout : Int32

    def initialize(@timeout = DEFAULT_TIMEOUT)
      @td_client = API.client_create
      @event_handlers = {} of Types::Base.class => Array(Event)
      @running = false
    end

    def on(klass : U.class, &block : U ->) forall U
      @event_handlers[klass] ||= [] of Event

      @event_handlers[klass] << Event.new do |base|
        block.call(base.as(U))
      end
    end

    def broadcast(query)
      API.client_send(@td_client, query)
    end

    def connect
      on Types::Update::AuthorizationState do |update|

        case update.authorization_state
        when Types::AuthorizationState::WaitTdlibParameters
          puts "WaitTdlibParameters"
          set_tdlib_parameters(Types::TdlibParameters.from_json(Client.settings.to_h.to_json))
        when Types::AuthorizationState::WaitEncryptionKey
          puts "WaitEncryptionKey"
          check_database_encryption_key(Client.settings.encryption_key)
        when Types::AuthorizationState::WaitPhoneNumber
          print "Enter your phone number (with +country code): "
          phone = STDIN.gets
          set_authentication_phone_number(phone.to_s)
        when Types::AuthorizationState::WaitCode
          print "Please enter the code sent by Telegram: "
          code = STDIN.gets
          check_authentication_code(code.to_s)
        when Types::AuthorizationState::WaitPassword
          print "Please enter your password: "
          password = STDIN.gets
          check_authentication_password(password.to_s)
        when Types::AuthorizationState::Ready

        end
      end

      loop do
        update = API.client_receive(@td_client, @timeout)
        handle_update(update) if update
      end
    end

    def handle_update(update)
      update = Types::Base.from_json(update)
      if handlers = @event_handlers[update.class]?
        handlers.each do |handler|
          handler.call(update)
        end
      end
    end

    def set_log_file_path(path)
      API.set_log_file_path(path)
    end
  end
end
