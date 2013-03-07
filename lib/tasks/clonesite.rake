require 'clonesite'

namespace :clone do

  desc "Clone site"
  task :site, [:site_name] => :environment do |t, args|
    args.with_defaults(:site_name => ENV['CLONE_SITE'])
    raise "Site name needed" unless(args.site_name)
    clone = CloneSite::Clone.new
    clone.clone(args.site_name)
  end

end

