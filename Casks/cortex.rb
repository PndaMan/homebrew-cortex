# Homebrew Cask for Cortex — install into your own tap:
#   1. Create a repo named `homebrew-cortex` (e.g. github.com/PndaMan/homebrew-cortex)
#   2. Put this file at Casks/cortex.rb
#   3. Users: `brew install --cask pndaman/cortex/cortex`
# Bump `version` + both sha256 on each release:
#   shasum -a 256 Cortex_1.0.1_aarch64.dmg
cask "cortex" do
  version "1.0.29"

  on_arm do
    sha256 "8fc95c40c894f94810aa32b05e97363535c84c00630fdbc305c4b8fbff47fbb0"
    url "https://github.com/PndaMan/cortex/releases/download/v#{version}/Cortex_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "14f70c904fa48de02b857554f0413f711eaa10e739dcbc16a1ecab592e017aad"
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
