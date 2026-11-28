cask "zalolite" do
  version "0.0.22"

  on_ventura :or_older do
    sha256 "3ac1d4599e1f2ecf230516588b4b0abb1f1c07b1c9d262079987648b8089bf19"

    url "https://github.com/lebad280324/zalolite/releases/download/v#{version}/Zalolite-#{version}-macos13-universal.dmg"
  end
  on_sonoma :or_newer do
    sha256 "2362dcaaee0d29f879e30eecbfeedeee063e87df27994f7879ee6dc295afe90e"

    url "https://github.com/lebad280324/zalolite/releases/download/v#{version}/Zalolite-#{version}-macos-universal.dmg"
  end

  name "Zalolite"
  desc "Native Zalo client"
  homepage "https://github.com/lebad280324/zalolite"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Zalolite.app"

  zap trash: [
    "~/Library/Application Support/ctdozlite-native",
    "~/Library/Preferences/com.ctdoteam1110.ctdozlite.native.plist",
  ]

  caveats <<~EOS
    Zalolite được ký ad-hoc, chưa được Apple notarize. Nếu macOS chặn lần mở đầu, vào
    System Settings → Privacy & Security rồi bấm Open Anyway.
  EOS
end
