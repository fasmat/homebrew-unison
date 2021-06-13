cask "unison240" do
  version "2.40.69"
  sha256 "2bcc460511f2b43fa1613cc5f9ba4dd59bb12d40b5b9fb2e9f21adaf854bcf3b"

  url "http://unison-binaries.inria.fr/files/Unison-#{version}_x64.dmg"
  name "Unison"
  desc "Unsion 2.40 file-synchronization tool"
  homepage "http://unison-binaries.inria.fr/"

  livecheck do
    skip "Intended to be a specific version for compatibility"
  end

  conflicts_with formula: "unison",
                 cask:    %w[
                   unison
                   unison232
                   unison248
                   unison251
                 ]

  app "Unison.app"
  binary "#{appdir}/Unison.app/Contents/MacOS/cltool", target: "unison"

  postflight do
    system_command "/usr/bin/defaults", args: ["write", "edu.upenn.cis.Unison", "CheckCltool", "-bool", "false"]
  end
end
