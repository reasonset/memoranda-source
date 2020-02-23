#!/usr/bin/ruby
require 'date'

indexes = {}

Dir.glob("**/.indexes.rbm") do |rbm|
  next if rbm[0] == "."
  dir = File.dirname(rbm).sub(/^\.?\/?/, "/")
  current = Marshal.load(File.read(rbm))
  current.each do |k ,v|
    v["_link_path"] = File.join(dir, v["_filename"].sub(/\.md$/, ".html"))
  end
  indexes.merge! current
end

indexes = indexes.map {|k,v| {sorter: (((v["updates"] || []) | [v["date"]]).max), title: v["title"], path: v["_link_path"]}}

puts "---", "title: 最新の投稿 (Latest 50)", "date: #{Date.today.strftime("%Y-%m-%d")}", "pagetype: recent", "---", ""

indexes.sort_by {|i| i[:sorter] }.reverse_each do |i|
  puts "* [#{i[:title]}](#{i[:path]}) @#{i[:sorter]}"
end