class RolODecks < Formula
    desc "Index and search slides in Powerpoint presentations"
    homepage "https://github.com/mr-tim/rol-o-decks"
    url "https://github.com/mr-tim/rol-o-decks/archive/v0.0.1.zip"
    sha256 "1bd6068f26aa968cd2abcc3b13e44710854f5e2c01d3934ce6adb04e68bdd956"
    depends_on "thought-machine/please/please"
    depends_on "elm"

    def install
        system "plz build //cmd/main:rol-o-decks"
        libexec.install Dir["plz-out/bin/cmd/main/*"]
        bin.install_symlink libexec/"rol-o-decks"
    end

    def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <true/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_bin}/rol-o-decks</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>WorkingDirectory</key>
      <string>#{HOMEBREW_PREFIX}</string>
      <key>StandardOutPath</key>
      <string>#{var}/log/rol-o-decks.log</string>
      <key>StandardErrorPath</key>
      <string>#{var}/log/rol-o-decks.log</string>
    </dict>
    </plist>
  EOS
  end
end