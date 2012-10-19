namespace :test do

  desc "Run all specs"
  task :run_all_specs do
    arguments = %W[rspec -f d spec/spec_helper.rb spec/*/]
    exec arguments.join(' ')
  end
end