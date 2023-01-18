# [kytta/dotfiles](https://codeberg.org/kytta/dotfiles)

Collection of configuration files.

## Apply

1. Install [chezmoi](https://www.chezmoi.io/install/).

   ```sh
   sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
   ```

2. Load the dotfiles.

   ```sh
   chezmoi init kytta
   ```

3. Diff (optional) and apply.

   ```sh
   chezmoi diff
   chezmoi apply
   ```

## Licence

[MIT](https://spdx.org/licenses/MIT.html) © 2022 Nikita Karamov

Uses code from:

- **[zsh-launchpad](https://github.com/marlonrichert/zsh-launchpad)**
  by Marlon Richert
- **[Prezto](https://github.com/sorin-ionescu/prezto)**
  by Sorin Ionescu

---

This project is hosted on GitHub:
<https://github.com/kytta/dotfiles>
