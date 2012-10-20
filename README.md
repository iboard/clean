A RUBY LESSON
=============

Initialized by Andreas Altendorfer on Juli 24, 2012 after
  studying Uncle Bob's 'Clean Code (Episodes 1 to 12)'. It's aim is to demonstrate and learn how a plain
  ruby-app (w/o Rails) can work in the matter of _CleanCode_

'clean' implements an Application-class which can execute UseCases. A 'UseCase' is
  a derivative of class UseCase and implements an 'exexute-method'.

A list of available commands can be found at the end of this file.

WHERE/HOW TO START?
===================

Requirements
------------

  * ruby 1.9.x
  * bundler
  * Used, 3rd-party gems are listed in Gemfile

        gem "rspec"
        gem "json"
        group :development do
          gem "yard"
          gem "redcarpet"
          gem "simplecov"
        end

Quickstart/run
--------------

  1. clone from GitHub

        git clone https://github.com/iboard/clean.git

  2. bundle

        cd clean
        bundle

  3. rake

        rake
        rspec spec/spec_helper.rb spec/*/

        # Provide evironment:
        ENVIRONMENT=test rake  # suppress output in test-mode :test is set by default use :devevlopement, :production
        FORMAT=d rake          # change rspec-output format (d ... text, p ... dots)

  4. run the app from the command-line

        bin/run.rb  --help
        bin/run.rb commands
        bin/run.rb loaded
        bin/run.rb --command="ExampleUsecase,'p1','p2','more Parameters...'"

Browse the code
===============

**app/**
The Application

**config/**
Boot and configure

**lib/**
Rake-tasks

![Dependencies](https://docs.google.com/viewer?pid=explorer&srcid=0BxdssCjqaEh6VzRJb0Y1Tl9iWkE&docid=2626c4310bfeb692f4123c60de559b74%7C5df9d15c4f275da200b25854bed41a94&a=bi&pagenumber=1&w=800)


Extend with your code
=====================

Write a class, derived from 'UseCase' somewhere in `app/usecases/my_class.rb`

    class MyClass < UseCase
      def desc
        "Describe your usecase on a single line"
      end
      def execute
        ... do something ...
      end
    end


See `app/usecases/example_usecase.rb`

Run the new UseCase

    bin/run.rb --command='MyClass,"parameter one","parameter two"'


100% Coverage & Documentation
=============================

When you fork this project it has 100% test-, and documentation-coverage.
It's up to you to keep at this level when starting your own Application.


Available Commands and Examples
===============================

    bin/run.rb --command='ApplicationInfo,"available_commands"'
    => ["ApplicationInfo (app/usecases/application_info.rb)", "ExampleUsecase (app/usecases/example_usecase.rb)", "UseCase (app/usecases/use_case.rb)"]

    bin/run.rb --command='ApplicationInfo,"loaded_files"'
    => [["Boot", "config/boot.rb"], ["Application", "app/application.rb"], ["ApplicationLoader", "app/application_loader.rb"], ["OptionsError", "app/exceptions/options_error.rb"], ["ApplicationInfo", "app/usecases/application_info.rb"], ["CommandRunner", "app/usecases/command_runner.rb"], ["ExampleUsecase", "app/usecases/example_usecase.rb"], ["UseCase", "app/usecases/use_case.rb"]]

    bin/run.rb --command='ExampleUsecase,"hello","world"' -v
    => I, [2012-10-20T02:28:15.899906 #10293]  INFO -- : Logger.level set to 1
       I, [2012-10-20T02:28:15.900042 #10293]  INFO -- : INITIALIZE CommandRunner.new(["ExampleUsecase", "\"hello\"", "\"world\""])
       I, [2012-10-20T02:28:15.900084 #10293]  INFO -- : Evaluate >> ExampleUsecase.new("hello","world")
       I, [2012-10-20T02:28:15.900132 #10293]  INFO -- : Executing ExampleUsecase (UseCase)

       USECASE EXAMPLE
       ===============
       /Users/aa/Development/clean/app/usecases/example_usecase.rb

       >  # -*- encoding : utf-8 -*-"
       >  class ExampleUsecase  < UseCase
       >
       >    def execute
       >      puts header
       >      system( "cat '#{__FILE__}' | sed 's/^/>  /'" )
       >      puts inspect_params
       >      0
       >    end
       >
       >
       >    protected
       >    def inspect_params
       >      puts "\n\nCalled with params: #{params.to_json}"
       >    end
       >
       >    def header
       >      "\nUSECASE EXAMPLE\n" + "="*"usecase example".length + "\n#{__FILE__}\n\n"
       >    end
       >
       >  end


       Called with params: ["hello","world"]

       I, [2012-10-20T02:28:15.905374 #10293]  INFO -- : Returned from ExampleUsecase => 0




License
=======

Public Domain Dedication
------------------------

This work is a compilation and derivation from other previously released works. With the exception of 
various included works, which may be restricted by other licenses, the author or authors of this code 
dedicate any and all copyright interest in this code to the public domain. We make this dedication for 
the benefit of the public at large and to the detriment of our heirs and successors. We intend this 
dedication to be an overt act of relinquishment in perpetuity of all present and future rights to this 
code under copyright law.

(c) 2012 by Andreas Altendorfer, <andreas@altendorfer.at>
