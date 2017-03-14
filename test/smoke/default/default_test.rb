# # encoding: utf-8

# Inspec test for recipe mongodb-windows::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe service('MongoDB') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

script = <<-EOH
  mongo --help
EOH

describe powershell(script) do
  its('stdout') { should match ".*MongoDB shell version: 2.6.12.*" }
end