namespace :uog_monitor do 
    
    task ping_sites: :environment do
        Site.all.each do |site|
            AddressStatusCheckJob.perform_later(site)
        end
    end
end 