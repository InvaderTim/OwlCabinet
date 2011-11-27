namespace :db do
  desc "Raise an error unless the RAILS_ENV is development"
  task :development_environment_only do
    raise "Development only pl0x!" unless Rails.env.development?
  end
  task :everything => [:environment, :development_environment_only, :drop, :create, :migrate, :seed] do
     desc "Recreate everything from scratch including pre-populated data"
  end
end