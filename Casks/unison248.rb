cask "unison248" do
  version "2.48.15"
  sha256 "89894d14c9ff3c4d6195cb6a8065a2849e6ad55951799eedf8879e1a257d3e11"

  url "https://github.com/bcpierce00/unison/releases/download/#{version}/Unison-OS-X-#{version}.zip",
      verified: "https://github.com/bcpierce00/unison"
  name "Unison"
  desc "Unsion 2.48 file-synchronization tool"
  homepage "https://www.cis.upenn.edu/~bcpierce/unison/"

  livecheck do
    skip "Intended to be a specific version for compatibility"
  end

  conflicts_with formula: "unison",
                 cask:    %w[
                   unison
                   unison232
                   unison240
                   unison251
                 ]

  app "Unison.app"
  binary "#{appdir}/Unison.app/Contents/MacOS/cltool", target: "unison"

  postflight do
    system_command "/usr/bin/defaults", args: ["write", "edu.upenn.cis.Unison", "CheckCltool", "-bool", "false"]
  end
end
