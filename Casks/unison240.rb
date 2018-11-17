cask 'unison240' do
  version '2.40.69'
  sha256 '2bcc460511f2b43fa1613cc5f9ba4dd59bb12d40b5b9fb2e9f21adaf854bcf3b'

  url "http://unison-binaries.inria.fr/files/Unison-#{version}_x64.dmg"
  name 'Unison'
  homepage 'http://unison-binaries.inria.fr/'

  conflicts_with formula: 'unison',
                 cask:    ['unison232',
                           'unison248',
                           'unison251']

  app 'Unison.app'
  binary "#{appdir}/Unison.app/Contents/MacOS/cltool", target: 'unison'

  postflight do
    system_command '/usr/bin/defaults', args: ['write', 'edu.upenn.cis.Unison', 'CheckCltool', '-bool', 'false']
  end
end
