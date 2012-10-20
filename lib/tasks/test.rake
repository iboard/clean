namespace :test do

  desc "Run all specs"
  task :run_all_specs do
    ENV['ENVIRONEMENT'] ||= "test"
    _format = ENV['FORMAT'] ||= "p"
    args = %W[rspec -f #{_format} spec/spec_helper.rb spec/*/]
    system args.join(" ")
  end
end