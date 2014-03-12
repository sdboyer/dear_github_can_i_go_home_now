#!/usr/bin/env ruby -w
require 'date'
require 'shellwords'

messages = [
  'My kid\'s appointment at the pediatrician can wait, I need to get this commit in.',
  'Sorry honey, I need to keep my streak going - we\'ll have sex tomorrow!'
]

gh_founding = DateTime.new(2008,7,21)

gh_founding.to_date.step(Date.today) do |day|
  File.open('self_worth', 'a') { |f| f.write("1\n") }
  system({'GIT_COMMITTER_DATE' => day.rfc2822, 'GIT_AUTHOR_DATE' => day.rfc2822}, "git commit -m '#{Shellwords.join(messages.sample.split(' '))}' self_worth")
end


