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



