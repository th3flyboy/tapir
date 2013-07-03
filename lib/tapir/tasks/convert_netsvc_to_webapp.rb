def name
  "convert_netsvc_to_webapp"
end

def pretty_name
  "Convert Network Service to Web Application"
end

## Returns a string which describes what this task does
def description
  "This task converts a network service into a web application"
end

## Returns an array of types that are allowed to call this task
def allowed_types
  [Tapir::Entities::NetSvc]
end

## Returns an array of valid options and their description/type for this task
def allowed_options
 []
end

def setup(entity, options={})
  super(entity, options)
end

## Default method, subclasses must override this
def run
  super

  # determine if this is an SSL application
  ssl = true if @entity.port_num == 443
  
  # construct uri
  protocol = ssl ? "https://" : "http://"
  uri = "#{protocol}#{@entity.host.ip_address}:#{@entity.port_num}"

  create_entity(Tapir::Entities::WebApplication, {
    :name => uri,
    :host => @entity.host,
    :netsvc => @entity
  })

end

def cleanup
  super
end