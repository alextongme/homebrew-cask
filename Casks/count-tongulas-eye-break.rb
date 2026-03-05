cask "count-tongulas-eye-break" do
  version "0.10.0"
  sha256 "bdd1cb990ca04b2236253affc98bcc8ea2d3000c1efbc7346e42dad9005859df"

  url "https://github.com/alextongme/count-tongulas-eye-break/releases/download/v#{version}/CountTongulasEyeBreak-#{version}.zip"
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
