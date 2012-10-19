namespace :doc do

  desc "Build YARD-documentation"
  task :build do
    sh "yard  - README.md TODO.md REQUIREMENTS.md; open doc/frames.html"
  end

end