# Homebrew Cask for Cortex — install into your own tap:
#   1. Create a repo named `homebrew-cortex` (e.g. github.com/PndaMan/homebrew-cortex)
#   2. Put this file at Casks/cortex.rb
#   3. Users: `brew install --cask pndaman/cortex/cortex`
# Bump `version` + both sha256 on each release:
#   shasum -a 256 Cortex_1.0.1_aarch64.dmg
cask "cortex" do
  version "1.0.28"

  on_arm do
    sha256 "257434473c11396c9c31cd285c7171cb5b2ef570110155f190ef52fb863a90fe"
    url "https://github.com/PndaMan/cortex/releases/download/v#{version}/Cortex_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "5240bb8e127c53d68b3e53ed0cda94a1b011419cb6ab65a050a6921a320ae81f"
    url "https://github.com/PndaMan/cortex/releases/download/v#{version}/Cortex_#{version}_x64.dmg"
  end

  name "Cortex"
  desc "Local-first, open-source NotebookLM alternative — a desktop study OS"
  homepage "https://github.com/PndaMan/cortex"

  # Vital runtime tools so ingestion works the moment Cortex launches:
  # poppler → pdftotext/pdftoppm (PDF text + page images), ffmpeg → audio.
  depends_on formula: ["poppler", "ffmpeg"]

  app "Cortex.app"

  zap trash: [
    "~/Library/Application Support/study.cortex.app",
    "~/Library/Caches/study.cortex.app",
  ]
end
