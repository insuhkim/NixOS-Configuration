# NixOS Configuration

A modular, Flake-based NixOS and standalone Home Manager configuration.

## Hosts

| Host | Hardware | Desktop Environment | Purpose |
| --- | --- | --- | --- |
| `old-laptop` | Lenovo IdeaPad Slim 5 | Mango WM / Noctalia | Laptop |

## Structure

```text
.
├── flake.nix              # Flake entry point (NixOS & Home Manager outputs)
├── flake.lock             # Pinned flake inputs
├── hosts/
│   ├── common.nix         # Shared system configuration across all hosts
│   └── old-laptop/        # Host configuration for Lenovo IdeaPad Slim 5
├── modules/
│   ├── cli/               # Command-line tools, terminal utilities, shell
│   ├── gui/               # GUI applications (Steam, WebCord, Readest, LocalSend)
│   ├── system/            # System settings (audio, bluetooth, boot, fonts, power, tailscale)
│   └── desktop/           # Desktop environments (KDE Plasma 6, Mango WM, Fcitx5)
└── home/
    ├── default.nix        # Standalone Home Manager entry point
    ├── git.nix            # Git configuration and aliases
    ├── mango/             # Mango WM configuration files
    ├── plasma-manager.nix # KDE Plasma settings via plasma-manager
    ├── terminal/          # Terminal setup (Kitty, Neovim)
    ├── zed.nix            # Zed editor configuration
    └── zen-browser.nix    # Zen Browser flake integration
```

## Features

- Modular Design: System modules are separated into CLI, GUI, Desktop, and System settings, controlled via a unified `base.*` option hierarchy.
- Standalone Home Manager: User environment and dotfiles are managed independently from system rebuilds via `homeConfigurations`.
- Desktops:
  - KDE Plasma 6 on Wayland with SDDM and Plasma Manager integration.
  - Mango WM dynamic tiling Wayland compositor paired with Noctalia shell and greeter.
- Development & Shell: Bash enhanced with ble.sh, Starship prompt, Neovim, Zed, Kitty, and modern CLI utilities (`ripgrep`, `fd`, `yazi`, `btop`, `eza`, `zellij`).
- Korean Input: Fcitx5 with Hangul support across desktop sessions.

## Usage

### System Rebuild

Rebuild the system configuration:

```bash
sudo nixos-rebuild switch --flake .#old-laptop
```

### Home Manager

Apply user configurations independently without rebuilding the whole system:

```bash
home-manager switch --flake .#insuhkim
```

Or target host-specific definition:

```bash
home-manager switch --flake .#insuhkim@old-laptop
```

### Flake Evaluation Check

Verify that all NixOS and Home Manager outputs evaluate properly:

```bash
nix flake check
```
