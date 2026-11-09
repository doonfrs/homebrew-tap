# All-in-One Messenger Hub - Homebrew tap

This folder is staged inside the app repo for convenience, but it lives in its own public
repo: `doonfrs/homebrew-tap` (Homebrew needs the `homebrew-` prefix to find a tap).

## How users install

```sh
brew install --cask doonfrs/tap/all-in-one-messenger-hub
```

## How updates work (zero touch)

`.github/workflows/update-cask.yml` runs every hour. It finds the newest release in
`doonfrs/all-in-one-messenger-hub-releases` that has `AllInOneMessengerHub.dmg` (Windows-only
releases are skipped), downloads it, and rewrites `version` and `sha256` in the cask. Nothing to
do per release besides publishing the DMG (`scripts/build_macos_dmg.sh`).

Run it by hand from the Actions tab (Update cask, Run workflow) after the first push.

## Editing the cask

Change `Casks/all-in-one-messenger-hub.rb` here, then copy it to the tap repo and push.
Check it on a Mac with:

```sh
brew tap doonfrs/tap
brew audit --cask doonfrs/tap/all-in-one-messenger-hub
brew install --cask doonfrs/tap/all-in-one-messenger-hub
```
