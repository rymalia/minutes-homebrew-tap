cask "minutes" do
  version "0.16.5"
  sha256 "5feafc9a99d824fcb946ee89d090c1182b7c594bbb20ada799a3a79d476a1a60"

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
