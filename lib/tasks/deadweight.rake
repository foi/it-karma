require 'deadweight'

Deadweight::RakeTask.new do |dw|
  dw.stylesheets = %w( /stylesheets/scaffold.css )
  dw.pages = %w( / /posts/1 /o_O )
end
