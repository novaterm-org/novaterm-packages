# NovaTerm Packages

Fork of [termux-packages](https://github.com/termux/termux-packages) configured for **NovaTerm** (`com.nvterm`).

## What's different

| Property | Termux | NovaTerm |
|----------|--------|----------|
| App name | Termux | NovaTerm |
| Internal name | `termux` | `nvterm` |
| Package name | `com.termux` | `com.nvterm` |
| Org | termux | PrometeoDEV |
| Architecture | 4 (arm, arm64, x86, x64) | 1 (arm64 only) |
| PREFIX | `/data/data/com.termux/files/usr` | `/data/data/com.nvterm/files/usr` |
| HOME | `/data/data/com.termux/files/home` | `/data/data/com.nvterm/files/home` |
| Repo URL | `packages-cf.termux.dev` | `packages.novaterm.dev` |

All packages compiled from this fork have NovaTerm paths hardcoded in binaries.

### properties.sh configuration

```bash
TERMUX__NAME="NovaTerm"
TERMUX__INTERNAL_NAME="nvterm"        # <=7 chars, used in paths/filenames
TERMUX_APP__PACKAGE_NAME="com.nvterm"
TERMUX__REPOS_HOST_ORG_NAME="PrometeoDEV"
TERMUX__REPOS_HOST_ORG_URL="https://github.com/PrometeoDEV"
```

Derived variables (automatic):
- `TERMUX__LNAME` → `novaterm`
- `TERMUX__UNAME` → `NOVATERM`
- `TERMUX_APP__DATA_DIR` → `/data/data/com.nvterm`

## Building

### Bootstrap (generates the initial ZIP for the APK)

```bash
# Via GitHub Actions (recommended)
# Go to Actions → Build Bootstrap → Run workflow

# Or locally with Docker
./scripts/run-docker.sh ./scripts/generate-bootstraps.sh --architectures aarch64
```

### Individual packages

```bash
./scripts/run-docker.sh ./build-package.sh -a aarch64 <package-name>
```

## CI Workflows

| Workflow | Schedule | Purpose |
|----------|----------|---------|
| `bootstrap.yml` | Weekly (Sunday) | Build bootstrap ZIP for APK embedding |
| `sync-upstream.yml` | Weekly (Monday) | Merge changes from termux/termux-packages |

## Using the bootstrap

1. Run the `Build Bootstrap` workflow
2. Download `bootstrap-aarch64.zip` from the release
3. Place in `NovaTerm/app/src/main/assets/bootstrap-aarch64.zip`
4. Rebuild NovaTerm APK

## License

Same as upstream: packages have their individual licenses.
Build system is licensed under Apache-2.0.
