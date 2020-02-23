#!/usr/bin/ruby
require 'erb'
require 'yaml'

COMMENT_TEMPLATE = <<END
% if comment["master"]
<section class="comment_master">
% else
<section class="comment">
% end
<%= comment["msg"].gsub("&", "&amp;").gsub("<", "&lt;").gsub(">", "&gt;").gsub('"', "&quot;").gsub("\n", "<br />\n") %>
<section class="commenter_name"><%= comment["name"] %></section><section class="comment_timestamp"><%= comment["timestamp"]%></section>
</section>
END

filepath = ARGV[0]

# Reject prefix

filepath = filepath.sub(%r!.*?/Build/!, "").sub(%r:\.[a-z]+$:, "").sub(%r!^\./!, "")

commentstr = nil

if File.exist?(".comments/#{filepath.gsub("/", "-")}")
  comments = []
  dfiles = Dir.children(".comments/#{filepath.gsub("/", "-")}").sort
  dfiles.each do |cfile|
    comment = nil
    File.open(".comments/#{filepath.gsub("/", "-")}/" + cfile) do |f|
      comment = YAML.load(f)
    end
    comments.push ERB.new(COMMENT_TEMPLATE, nil, "%").result(binding)
  end
  commentstr = comments.join("\n")
else
  commentstr = "<p>No comments avilable yet...</p>"
end

doc = ARGF.read

puts doc.sub(/.*\<!-- REPLACE WITH COMMENTS --\>.*/, commentstr)