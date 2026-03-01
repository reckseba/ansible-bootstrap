# ansible-bootstrap

## Arch Linux Installation Steps

- Boot Arch Linux Live USB
- `loadkeys de-latin1` (`loadkezs de?latin1`)
- Find storage device target and thumb drive with config: `lsblk`
- `mkdir /mnt/usb && mount /dev/sdX /mnt/usb`
- Check that wifi is unblocked: `rfkill --output-all`
- Use [iwctl](https://wiki.archlinux.org/title/Iwd#iwctl) to connect to wifi: `iwctl station <wlan0> connect <SSID>`
- Update archinstall: `pacman -Sy archinstall`
- Make a copy: `cp /mnt/usb/user_configuration.json /mnt/usb/user_configuration_arch.json`
- Edit: `vim /mnt/usb/user_configuration_arch.json`
  - Partition Sizes
  - Hostname
  - Target Storage Device
- `archinstall --dry-run --config /mnt/usb/user_configuration_arch.json --creds /mnt/usb/user_credentials.json`
- Inside archinstall check the partitions and disk encryption settings
- Then remove `--dry-run` and just do it
- after installation reboot
- Import your public key `gpg --import public.asc` and validate `gpg -K`
  - `gpg --card-edit` and `fetch` would also work when you published the key somewhere
- Then trust it `gpg --edit-key <keyID>` and `trust`
- Temporarily wire the gpg agent for ssh `export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"`
  - it will get permanently wired when the `.zshrc` is loaded from the .dotfiles
- bootstrap: `curl -fsSL https://raw.githubusercontent.com/reckseba/ansible-bootstrap/refs/heads/main/arch.sh | bash`

