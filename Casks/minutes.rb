cask "minutes" do
  version "0.10.3"
  sha256 "a0c6e0614b825085b870a1fd6d3f6266cf2664e28646027534fa127c35148779"

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
