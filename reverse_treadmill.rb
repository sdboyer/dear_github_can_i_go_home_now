#!/usr/bin/env ruby -w
require 'date'

messages = [
  'My kid\'s appointment at the pediatrician can wait, I need to get this commit in.',
  'Sorry honey, I need to keep my streak going - we\'ll have sex tomorrow!'
]

gh_founding = DateTime.new(2008,7,21)
system({'GIT_COMMITTER_DATE' => gh_founding.to_date.rfc2822, 'GIT_AUTHOR_DATE' => gh_founding.to_date.rfc2822}, "env")

gh_founding.to_date.step(Date.today) do |day|
  File.open('self_worth', 'a') { |f| f.write("1\n") }
  File.open('msg', 'w') { |f| f.write(messages.sample) }
  system({'GIT_COMMITTER_DATE' => day.rfc2822, 'GIT_AUTHOR_DATE' => day.rfc2822}, "git commit -F msg -- self_worth")
end

