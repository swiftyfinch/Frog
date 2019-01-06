Pod::Spec.new do |s|
  s.name             = 'Frog'
  s.version          = '1.1.2'
  s.summary          = 'Tiny utility for read and write file line by line in Swift.'
  s.description      = <<-DESC
    I wrote this for easier work with files in some algorithms implementations.
    In some cases read and write line by line in Swift take a lot of part of an implementation.
  DESC

  s.homepage         = 'https://github.com/artFintch/Frog'
  s.screenshots     = 'https://pbs.twimg.com/media/DsYELTUXQAEZ1zx.jpg'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vyacheslav Khorkov' => 'artfintch@ya.ru' }
  s.source           = { :git => 'https://github.com/artFintch/Frog.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/artFintch'

  s.platform = :osx
  s.osx.deployment_target = "10.10"
  s.swift_version = "4.2"
  s.source_files = 'Frog/Classes/**/*'
end
