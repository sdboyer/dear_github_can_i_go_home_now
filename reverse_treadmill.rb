#!/usr/bin/env ruby -w
require 'date'

messages = [
  'My kid\'s appointment at the pediatrician can wait, I need to get this commit in.',
  'Sorry honey, I need to keep my streak going - we\'ll have sex tomorrow!'
]

gh_founding = DateTime.new(2008,7,21)

gh_founding.to_date.step(Date.today) do |day|
  `GIT_COMMITTER_DATE=#{day.rfc2822} GIT_AUTHOR_DATE=#{day.rfc2822} git commit my_value_as_a_coder -m '#{messages.sample}'`
end


