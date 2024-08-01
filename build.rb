#!/usr/bin/env ruby

require_relative 'generate'

archs = %w[amd64 arm64 armhf]
system "snapcraft remote-build --build-on=#{archs.join(",")} --launchpad-accept-public-upload"
