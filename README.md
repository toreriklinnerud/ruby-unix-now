# run | Ruby Unix Now
A tiny library which attempts to bridge the gap between ruby code and executing system commands. No more more string concatenation to build up commands. 

The simplest way to execute a command in ruby is to embed your command in backticks. 

    `whoami` #=> john

So far, so good. Using run, the equivalent command would be 
    run :whoami
  
Not much difference. However, as soon as we start to introduce arguments, conditional logic and so on, string concatenation and backticks starts to get ugly.

    command = "rsync -r, --progress"
    command << " -z -h " if condition_x
    command << " --from #{from_path} --to #{to_path}"
    `#{command}`
  
Run tries to solve these problems my making it easy to

  1. Embed variables
  2. Add optional arguments
  3. Lay out complicated commands

It does this just by assigning meaning to the standard Ruby structures. 
  
  - Hashes are options
  - Symbols are either commands or flags
  - Strings are values
  - Arrays are lists of options

The equivalent run command to the one above would be

    options = {}
    options.merge!(:z, :h) if condition_x_
    run :rsync, :r, :progress, options, :from => from_path, :to => to_path
  
Nore more embedding variables in string, no more arbitrary spaces to make 
strings glue together correctly.

Another example taken from a real life script

Normal commands
  
    `mkdir -p #{xapian_path}`
    `rm -r -f #{to`
    `cp -r, #{from} #{to}`
  
With run

    run :mkdir, :p, xapian_path
    run :rm, :r, :f, to
    run :cp, :r, from, to

Run also helps you along with some other common scenarios, such as aborting on error and echoing commands as they are executed.

## More examples

    psql = ['psql', :d, source['database'], auth]
    input = ['pg_dump', :i, auth, '--data-only', :table,'xapian_texts', config['database']]
    run input, '|', psql