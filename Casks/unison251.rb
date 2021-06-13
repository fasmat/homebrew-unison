cask "unison251" do
  version "2.51.2"
  sha256 "0738a6978fa29bb2af409322069cc20df293b770877942ac4b8774f06e774aa5"

  url "https://github.com/bcpierce00/unison/releases/download/v#{version}/Unison-#{version}.OS.X.zip",
      verified: "https://github.com/bcpierce00/unison"
  name "Unison"
  desc "Unsion 2.51 file-synchronization tool"
  homepage "https://www.cis.upenn.edu/~bcpierce/unison/"

  livecheck do
    skip "Intended to be a specific version for compatibility"
  end

  conflicts_with formula: "unison",
                 cask:    %w[
                   unison
                   unison232
                   unison240
                   unison248
                 ]

  app "Unison.app"
  binary "#{appdir}/Unison.app/Contents/MacOS/cltool", target: "unison"

  postflight do
    system_command "/usr/bin/defaults", args: ["write", "edu.upenn.cis.Unison", "CheckCltool", "-bool", "false"]
  end
end
