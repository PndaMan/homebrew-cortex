# Homebrew Cask for Cortex — install into your own tap:
#   1. Create a repo named `homebrew-cortex` (e.g. github.com/PndaMan/homebrew-cortex)
#   2. Put this file at Casks/cortex.rb
#   3. Users: `brew install --cask pndaman/cortex/cortex`
# Bump `version` + both sha256 on each release:
#   shasum -a 256 Cortex_1.0.1_aarch64.dmg
cask "cortex" do
  version "1.0.22"

  on_arm do
    sha256 "cae60e6075e76f1bac07d4926086257318b1f4f9a7d4148c5f61d25322387e05"
    url "https://github.com/PndaMan/cortex/releases/download/v#{version}/Cortex_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "749dd73209c5428a309345c22655d4d341da8e4c5425d664a4f349c5b6194c93"
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
