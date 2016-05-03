# load 'neo4j/tasks/neo4j_server.rake'
# load 'neo4j/tasks/migration.rake'

desc "Example of task with parameters and prerequisites"
task :my_task, [:first_arg, :second_arg] => ["first_task", "second_task"] do |t, args|
  args.with_defaults(:first_arg => "Foo", :last_arg => "Bar")
  puts "First argument was: #{args.first_arg}"
  puts "Second argument was: #{args.second_arg}"
end
