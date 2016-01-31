module HTTP
  module Timeout
    class PerOperation < Null
      # Read data from the socket
      def readpartial(size)
        rescue_readable do
          @socket.read_nonblock(size)
        end
      rescue EOFError
        :eof
      end

      # Write data to the socket
      def write(data)
        rescue_writable do
          @socket.write_nonblock(data)
        end
      rescue EOFError
        :eof
      end
    end
  end
end
