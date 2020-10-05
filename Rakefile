require 'erb'
require 'fileutils'

versions = %w[2.4.10 2.5.8 2.6.6 2.7.2 2.8.0]
tracks = versions.map{|v| v.split(".")[0..1].join(".") }
bundler_v = "2.1.4"

task :build do
  versions.each do |v|
    puts "Build #{v} snap package"

    abi_v = v.split(".").tap{|v| v[-1] = "0"}.join(".")
    series_v = abi_v[0..2]

    yml = ERB.new(File.read("snap/local/snapcraft.yaml.erb")).result(binding)
    File.open("snap/snapcraft.yaml", "w") {|f| f.puts yml }

    unless File.exist?("ruby_#{v}_amd64.snap")
      system "snapcraft clean"
      system "snapcraft"
    end
  end
end

task :push => :build do
  versions.each do |v|
    system "snapcraft push ruby_#{v}_amd64.snap"
  end
end

require 'rake/clean'
Rake::Cleaner.cleanup_files(FileList["*.snap"])
