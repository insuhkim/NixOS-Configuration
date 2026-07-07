{
  # Prompt
  programs.oh-my-posh.enable = true;

  # ZSH
  programs.zsh = {
    enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      update-verbose = "sudo nixos-rebuild switch --show-trace --print-build-logs --verbose";
      nixgc = "nix-collect-garbage --delete-old && sudo nix-collect-garbage --delete-old";
      why-installed = "nix-store --gc --print-roots | rg -v '/proc/' | rg -Po '(?<= -> ).*' | xargs -o nix-tree";

      zed = "zeditor";
      ls = "eza";
      lt = "eza --tree --level=2";
      ff = "fastfetch";
      cat = "bat";
      grep = "rg";
      cd = "z";
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    prezto = {
      enable = true;
      editor.keymap = "vi";
      pmodules = [
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "spectrum"
        "utility"
        "completion"
        "prompt"
      ];
    };
  };
}
