A PURE RUBY FRAMEWORK FOR CLEAN APPLICATION DEVELOPMENT
=======================================================

Initialized by Andreas Altendorfer on Juli 24, 2012 after
  studying Uncle Bob's 'Clean Code (Episodes 1 to 12)'. It's aim is to demonstrate and learn how a plain
  ruby-app (w/o Rails) can work in the matter of _CleanCode_

'clean' implements an Application-class which can run commands. A 'command' is
  a subclass of BaseCommand and has a 'run-method'.

A list of available commands can be found at the end of this file.

WHERE/HOW TO START?
===================

Requirements
------------

  * ruby 1.9.x
  * bundler
  * Used, 3rd-party gems are listed in Gemfile

Quickstart/run
--------------

  1. clone from GitHub
  2. bundle
  3. rake

  > $ rake
  > rspec spec/spec_helper.rb spec/*/
  > ..

  4. run the app from the command-line

  > ruby bin/run.rb


Browse the code
---------------

**app/**
The Application

**config/**
Boot and configure

**lib/**
Rake-tasks


100%
====

When you fork this project it has 100% test-, and documentation-coverage.
It's up to you to keep at this level when starting your own Application.


Available Commands and Examples
===============================

```sh
  ~/Development/clean(master) $ bin/run.rb --command=ApplicationDebugger,'"loaded_files"' -verbose

  I, [2012-08-25T23:00:22.138695 #18958]  INFO -- : Logger.level set to 1
  I, [2012-08-25T23:00:22.138869 #18958]  INFO -- : INITIALIZE CommandRunner.new(["ApplicationDebugger", "\"modules\""])
  I, [2012-08-25T23:00:22.138980 #18958]  INFO -- : Evaluate >>ApplicationDebugger.new("modules")<<
  Boot
  config/boot.rb
  Application
  app/application.rb
  ApplicationLoader
  app/application_loader.rb
  ApplicationDebugger
  app/commands/application_debugger.rb
  BaseCommand
  app/commands/base_command.rb
  CommandRunner
  app/commands/command_runner.rb
  OptionsError
  app/exceptions/options_error.rb

```


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
