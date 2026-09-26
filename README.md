# Homebrew tap

Homebrew formulas and public, versioned release binaries for multiple tools.

```sh
brew install pprotas/tap/slopbox
```

The current Slopbox binary supports Apple Silicon macOS only. Slopbox is experimental and requires Node.js, the Pi CLI, and host configuration before starting a session.

## Development

Review `.envrc`, then run `direnv allow` or `nix develop`. The flake provides Git, GitHub CLI, Ruby, curl and nixfmt. Homebrew is installed on the host, not provided by the dev shell.

```sh
nixfmt --check flake.nix
brew audit --strict Formula/slopbox.rb
```

## Publishing packages

Place each formula in `Formula/<package>.rb`. Use a package-specific release tag, such as `<package>-v<version>`, so packages can version independently. Archive names include the package, version and platform/architecture. Each formula pins the public asset URL and SHA-256.

1. Build and test on each supported platform. Check the binaries for unintended runtime library dependencies.
2. Archive the binaries with a stable layout. Calculate the archive SHA-256 with `shasum -a 256 <archive>` on macOS (or `sha256sum` on Linux).
3. Update the formula's URL, version and checksum; commit and push the formula.
4. Publish the GitHub Release with the exact archive: `gh release create <package>-v<version> <archive> -R pprotas/homebrew-tap --title '<package> <version>' --notes 'Release <version>'`.
5. Verify an unauthenticated download, `brew audit --strict Formula/<package>.rb`, and `brew install` / `brew test` on each supported platform.

Do not replace an archive at an existing URL: release a new version with a new checksum instead.
