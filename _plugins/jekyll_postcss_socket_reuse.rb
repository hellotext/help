# frozen_string_literal: true

require "socket"
require "jekyll-postcss/socket"

module PostCss
  class Socket
    POSTCSS_PORT = 8124

    class << self
      def ensure_dev_server!
        postcss_server_mutex.synchronize do
          return if postcss_server_running?

          start_postcss_server!

          wait_for_dev_server!
        end
      end

      private

      def postcss_server_mutex
        @postcss_server_mutex ||= Mutex.new
      end

      def postcss_server_running?
        TCPSocket.open("127.0.0.1", POSTCSS_PORT).close
        true
      rescue StandardError
        false
      end

      def start_postcss_server!
        @postcss_server_pid = spawn(
          POSTCSS_SCRIPT,
          "--development",
          out: File::NULL,
          err: File::NULL
        )
        Process.detach(@postcss_server_pid)
        at_exit { stop_postcss_server! }
      end

      def stop_postcss_server!
        return unless @postcss_server_pid

        Process.kill("TERM", @postcss_server_pid)
      rescue Errno::ESRCH
        nil
      ensure
        @postcss_server_pid = nil
      end

      def wait_for_dev_server!
        attempts = 0

        until postcss_server_running?
          attempts += 1
          raise "Could not connect to the PostCSS server" if attempts >= MAX_ATTEMPTS

          sleep 0.1
        end
      end
    end

    private

    def start_dev_server
      self.class.ensure_dev_server!
      @postcss = connect_to_dev_server
    end

    def connect_to_dev_server
      attempts = 0

      begin
        TCPSocket.open("localhost", POSTCSS_PORT)
      rescue StandardError
        attempts += 1

        if attempts < MAX_ATTEMPTS
          sleep 0.1
          retry
        end

        raise "Could not connect to the PostCSS server"
      end
    end
  end
end
