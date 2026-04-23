cask "minutes" do
  version "0.14.1"
  sha256 "7dccbfd5e4f09f3ba24df4c01d91b07c21e42be2bfd3692835f7ff7119bed63b"

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
