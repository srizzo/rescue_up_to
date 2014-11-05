require "rescue_up_to/version"

module Kernel
  
  # Rescues / retries a block, up to +times+ times.
  #
  # ==== Examples
  #
  #   # Rescue / retry something, up to 10 times
  #   value = rescue_up_to(10.times) do
  #     # do something, retry on StandardError...
  #   end
  #
  #   # A more complex / useful example, fetch Google's home page
  #   require 'open-uri'
  #   contents = rescue_up_to(10.times, from: SocketError, with: ->(rescued_times){sleep rescued_times} ) do
  #     open('http://www.google.com').read 
  #   end
  #   # => "[...]"
  #
  #
  def rescue_up_to times, from: StandardError, with: nil # :yields: rescued_times
    times.each do |rescued_times|
      begin
        return yield rescued_times
      rescue *from => e
        with.call(rescued_times) if with
      end
    end
    yield (times.max + 1)
  end
end