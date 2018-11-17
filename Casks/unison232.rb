cask 'unison232' do
  version '2.32.12'
  sha256 '1b820542984d575abba5911608390c8eb4f1624fdec7db86f89dc52ce08a9d2b'

  url 'http://unison-binaries.inria.fr/files/Unison-2.32.dmg'
  name 'Unison'
  homepage 'http://unison-binaries.inria.fr/'

  conflicts_with formula: 'unison',
                 cask:    ['unison240',
                           'unison248',
                           'unison251']

  app 'Unison.app'
  binary "#{appdir}/Unison.app/Contents/MacOS/cltool", target: 'unison'

  postflight do
    system_command '/usr/bin/defaults', args: ['write', 'edu.upenn.cis.Unison', 'CheckCltool', '-bool', 'false']
  end
end
