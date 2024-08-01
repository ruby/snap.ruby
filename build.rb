#!/usr/bin/env ruby

require 'erb'
require 'fileutils'

archs = %w[amd64 arm64 armhf]

puts "Build #{v} snap package"

v = ARGV[0] || '3.3.4'
abi_v = v.split(".").tap{|v| v[-1] = "0"}.join(".")
series_v = abi_v[0..2]

yml = ERB.new(File.read("snap/local/snapcraft.yaml.erb")).result(binding)
File.open("snap/snapcraft.yaml", "w") {|f| f.puts yml }

system "snapcraft remote-build --build-on=#{arch.join(",")} --launchpad-accept-public-upload"
