require 'erb'
require 'fileutils'

versions = File.read("versions.txt").split
tracks = versions.map{|v| v.split(".")[0..1].join(".") }

task :build do
  versions.each do |v|
    puts "Build #{v} snap package"

    abi_v = v.split(".").tap{|v| v[-1] = "0"}.join(".")
    series_v = abi_v[0..2]

    yml = ERB.new(File.read("snap/local/snapcraft.yaml.erb")).result(binding)
    File.open("snap/snapcraft.yaml", "w") {|f| f.puts yml }

    system "snapcraft clean"
    system "snapcraft remote-build --build-on=amd64,arm64,armhf,i386 --launchpad-accept-public-upload"
  end
end

task :push => :build do
  versions.each do |v|
    system "snapcraft push ruby_#{v}_amd64.snap"
  end
end

require 'rake/clean'
Rake::Cleaner.cleanup_files(FileList["*.snap"])
