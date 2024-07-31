require 'erb'
require 'fileutils'

versions = File.read("versions.txt").split
tracks = versions.map{|v| v.split(".")[0..1].join(".") }
archs = %w[amd64 arm64 armhf]

task :build do
  versions.each do |v|
    puts "Build #{v} snap package"

    abi_v = v.split(".").tap{|v| v[-1] = "0"}.join(".")
    series_v = abi_v[0..2]

    yml = ERB.new(File.read("snap/local/snapcraft.yaml.erb")).result(binding)
    File.open("snap/snapcraft.yaml", "w") {|f| f.puts yml }

    system "snapcraft remote-build --build-on=#{arch.join(",")} --launchpad-accept-public-upload"
  end
end

task :push do
  versions.each do |v|
    archs.each do |arch|
      system "snapcraft upload ruby_#{v}_#{arch}.snap"
    end
  end
end

require 'rake/clean'
Rake::Cleaner.cleanup_files(FileList["*.snap"])
