# redir container

- Base: current stable Debian 13 slim; Debian package `redir` 3.3.
- Build: `docker build --pull -t local/redir .`
- Run: `docker run --rm local/redir redir -n [SRC]:PORT [DST]:PORT`
- The original image did not define an entrypoint; the `redir` command remains explicit.
- redir 3.3 retains `--laddr`, `--lport`, `--caddr` and `--cport` compatibility options. Both positional syntax and legacy options passed real TCP forwarding tests on temporary localhost ports.

## Upgrade and security evidence

- The previous Debian 8 recipe fails at `apt-get update` because Jessie has left the normal mirrors. Debian 8 is end-of-life; no supported same-major upgrade target exists. No cosmetic minor PR is opened for an already-floating Debian 8 tag.
- Debian 13 builds successfully; `redir --version` reports 3.3; both forwarding tests pass.
- Trivy 0.76.1, current DB, 2026-10-27: 163 package findings (0 critical, 44 high, 58 medium, 60 low, 1 unknown). These are vendor scanner findings, not proof of reachability. High findings and fix availability are in [SECURITY-UPGRADE.json](SECURITY-UPGRADE.json).
- Current base packages retain vulnerabilities without fixed versions advertised by the scanner. This upgrade does not eliminate all security issues. No open Dependabot alerts were returned; that does not cover OS packages.
- No existing forwarding service or host setting was changed. Test containers were removed.
