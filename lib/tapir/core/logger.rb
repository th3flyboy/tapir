require 'singleton'
#
# Simple logger class for the whole application
#

class TapirLogger

  include Singleton

  def initialize
    @out = File.open(File.join(Rails.root,"log","tapir.log"), "a")
  end

  def log(message)
    _log "[_] Tapir: " << message  
  end

  ######
  def debug(message) 
    _log "[D] Tapir: " << message
  end

  def good(message)
    _log "[+] Tapir: " << message
  end

  def error(message)
    _log "[-] Tapir: " << message
  end
  ######

private 
  def _log(message) 
   @out.puts message
   @out.flush
  end

end