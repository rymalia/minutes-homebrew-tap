cask "minutes" do
  version "0.17.3"
  sha256 "577120e8d12826e008d103eaff2419dcc5a740ecbf823007ef6b896b467a1ea8"

  url "https://github.com/silverstein/minutes/releases/download/v#{version}/Minutes_#{version}_aarch64.dmg",
      verified: "github.com/silverstein/minutes/"
  name "Minutes"
  desc "Privacy-first conversation memory — record, transcribe, search meetings locally"
  homepage "https://useminutes.app/"

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "Minutes.app"

  postflight do
    system "xattr", "-cr", "#{appdir}/Minutes.app"
  end

  zap trash: [
    "~/.config/minutes",
    "~/.minutes",
  ]

  caveats <<~EOS
    To download a whisper model for transcription:
      minutes setup --model small

    For the CLI (record, stop, search from terminal):
      brew install silverstein/tap/minutes
  EOS
end
