namespace :domains do
  desc "Update domains"
  task :update_all => :environment do
    domains = Domain.all
    puts "Enqueuing update of #{domains.size} domains..."
    domains.each do |domain|
      UpdateDomainJob.perform_later(domain.id)
    end
  end
end






