cask "count-tongulas-eye-break" do
  version "0.11.6"
  sha256 "411336376b9bf0c745d845ef0a163576c688f3555398b725258499bf7cc08029"

  url "https://github.com/alextongme/count-tongulas-eye-break-releases/releases/download/v#{version}/CountTongulasEyeBreak-#{version}.zip"
  name "Count Tongula's Eye Break"
  desc "Menu bar app that reminds you to rest your eyes using the 20-20-20 rule"
  homepage "https://github.com/alextongme/count-tongulas-eye-break"

  app "Count Tongula's Eye Break.app"

  postflight do
    # Strip quarantine flag (app is not code-signed, needs sudo for /Applications)
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Count Tongula's Eye Break.app"],
                   sudo: true
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
