require 'erb'
require 'fileutils'

task :build do
  versions = %w[2.3.8 2.4.5 2.5.3]
  versions.each do |v|
    puts "Build #{v} snap package"

    abi_v = v.split(".").tap{|v| v[-1] = "0"}.join(".")
    bundler_v = "1.17.1"

    yml = ERB.new(File.read("snap/local/snapcraft.yaml.erb")).result(binding)
    File.open("snap/snapcraft.yaml", "w") {|f| f.puts yml }

    unless File.exist?("ruby_#{v}_amd64.snap")
      `snapcraft clean`
      `snapcraft`
    end
  end
end
