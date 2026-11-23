cask "zalolite" do
  version "0.0.21"

  on_ventura :or_older do
    sha256 "ed237d77b58d6c1c34485c8b91214ffed9f78c9c166c85ff0f7d7c9ad49b2e62"

    url "https://github.com/lebad280324/zalolite/releases/download/v#{version}/Zalolite-#{version}-macos13-universal.dmg"
  end
  on_sonoma :or_newer do
    sha256 "4460f3b1c1169dcd1133d457c7360432e513700c3c67626fd1a8cd376b699eb3"

    url "https://github.com/lebad280324/zalolite/releases/download/v#{version}/Zalolite-#{version}-macos-universal.dmg"
  end

  name "Zalolite"
  desc "Native Zalo client"
  homepage "https://github.com/lebad280324/zalolite"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Zalolite.app"

  # The app is ad-hoc signed and not notarized; the in-app updater clears this flag the same way.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Zalolite.app"]
  end

  zap trash: [
    "~/Library/Application Support/ctdozlite-native",
    "~/Library/Preferences/com.ctdoteam1110.ctdozlite.native.plist",
  ]
end
