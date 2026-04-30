cask "minutes" do
  version "0.16.0"
  sha256 "7caa6de2d7d0e7444cd1a8b69e52f14f51c6e34682260c54f5500d046fcb6aec"

  url "https://github.com/silverstein/minutes/releases/download/v#{version}/Minutes_#{version}_aarch64.dmg"
  name "Minutes"
  desc "Privacy-first conversation memory — record, transcribe, search meetings locally"
  homepage "https://useminutes.app"

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
