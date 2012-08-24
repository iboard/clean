namespace :doc do

  desc "Build YARD-documentation"
  task :build do
    sh "yard; open doc/frames.html"
  end

end