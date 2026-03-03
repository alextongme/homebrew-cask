cask "count-tongulas-eye-break" do
  version "0.2.0"
  sha256 "49c17ec35a779afc3f55f37154c9c7c46588a082bbff4d37f6c6f26a6bb94815"

  url "https://github.com/alextongme/count-tongulas-eye-break/releases/download/v#{version}/CountTongulasEyeBreak-#{version}.zip"
  name "Count Tongula's Eye Break"
  desc "Menu bar app that reminds you to rest your eyes using the 20-20-20 rule"
  homepage "https://github.com/alextongme/count-tongulas-eye-break"

  app "Count Tongula's Eye Break.app"

  postflight do
    # Strip quarantine flag (app is not code-signed)
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Count Tongula's Eye Break.app"]
    # Launch the app (sets up LaunchAgent on first run)
    system_command "open", args: ["#{appdir}/Count Tongula's Eye Break.app"]
  end

  uninstall launchctl: "com.counttongula.eyebreak",
            quit:      "com.counttongula.eyebreak"

  zap trash: [
    "~/Library/Application Support/CountTongula",
    "~/Library/LaunchAgents/com.counttongula.eyebreak.plist",
    "~/Library/Preferences/com.counttongula.eyebreak.plist",
  ]
end
