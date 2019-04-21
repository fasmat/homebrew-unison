cask 'unison248' do
  version '2.48.15'
  sha256 '89894d14c9ff3c4d6195cb6a8065a2849e6ad55951799eedf8879e1a257d3e11'

  # github.com/bcpierce00/unison was verified as official when first introduced to the cask
  url "https://github.com/bcpierce00/unison/releases/download/#{version}/Unison-OS-X-#{version}.zip"
  appcast 'https://github.com/bcpierce00/unison/releases.atom'
  name 'Unison'
  homepage 'https://www.cis.upenn.edu/~bcpierce/unison/'

  conflicts_with formula: 'unison',
                 cask:    [
                            'unison232',
                            'unison240',
                            'unison251',
                          ]

  app 'Unison.app'
  binary "#{appdir}/Unison.app/Contents/MacOS/cltool", target: 'unison'

  postflight do
    system_command '/usr/bin/defaults', args: ['write', 'edu.upenn.cis.Unison', 'CheckCltool', '-bool', 'false']
  end
end
