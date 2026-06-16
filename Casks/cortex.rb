# Homebrew Cask for Cortex — install into your own tap:
#   1. Create a repo named `homebrew-cortex` (e.g. github.com/PndaMan/homebrew-cortex)
#   2. Put this file at Casks/cortex.rb
#   3. Users: `brew install --cask pndaman/cortex/cortex`
# Bump `version` + both sha256 on each release:
#   shasum -a 256 Cortex_1.0.1_aarch64.dmg
cask "cortex" do
  version "1.0.21"

  on_arm do
    sha256 "e20fdc51f8c0f726a26401442b9b1348131e8a701e85f99d062d83cf5fe04b7b"
    url "https://github.com/PndaMan/cortex/releases/download/v#{version}/Cortex_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "93e1e9380c4fb57c4710f36a4d678b4d3aebe0f7e12d8d29de4d8873c52ee378"
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
