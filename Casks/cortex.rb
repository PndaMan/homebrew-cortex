# Homebrew Cask for Cortex — install into your own tap:
#   1. Create a repo named `homebrew-cortex` (e.g. github.com/PndaMan/homebrew-cortex)
#   2. Put this file at Casks/cortex.rb
#   3. Users: `brew install --cask pndaman/cortex/cortex`
# Bump `version` + both sha256 on each release:
#   shasum -a 256 Cortex_1.0.1_aarch64.dmg
cask "cortex" do
  version "1.0.11"

  on_arm do
    sha256 "1c38c018faf58ef961dd4357ea6d66e76de57f93dc7e80211ab0fa72815a29be"
    url "https://github.com/PndaMan/cortex/releases/download/v#{version}/Cortex_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "7b08ac21acdfc0faa85091ca6a260530628746945f462e77a5477a871af06cdf"
    url "https://github.com/PndaMan/cortex/releases/download/v#{version}/Cortex_#{version}_x64.dmg"
  end

  name "Cortex"
  desc "Local-first, open-source NotebookLM alternative — a desktop study OS"
  homepage "https://github.com/PndaMan/cortex"

  app "Cortex.app"

  zap trash: [
    "~/Library/Application Support/study.cortex.app",
    "~/Library/Caches/study.cortex.app",
  ]
end
