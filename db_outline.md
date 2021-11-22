##shared
site
    address:string
    type:integer
    Status:online,offline,maintance
    |user:id
    time_out:integer
    maintenance:boolean true=undermaintenance
    ssl_expires_at:datetime
    
user
    name:string

monitor_locations
    name:string
    url:string #ip address  

##notshared
site_responses
    |site:id
    status_code:integer
    response_time:float


user
    username:
    encrypted_password:
    enabled:

endpoint_type
    type:string
    requesttype:string

monitorlocation
    name:string
    address:string

site
    address
    updated_by
    endpoint_type:endpoint_type:id:integer
    delay:integer
    monitoring:true(we are monitoring)
    status:(status code)

    ssl_expires_at:datetime(make its on cert table)
    timestamp(created at and updated at)

responses
    site:relation
    monitor:location
    status:status code
    relaytime:float

certificate_information
    site:relation
    ssl_data_dump:string
    (LATER)timedate


