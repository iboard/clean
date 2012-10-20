namespace :test do

  desc "Run all specs"
  task :run_all_specs do
    ENV['ENVIRONEMENT'] ||= "test"
    args = %W[rspec -f d spec/spec_helper.rb spec/*/]
    system args.join(" ")
  end
end