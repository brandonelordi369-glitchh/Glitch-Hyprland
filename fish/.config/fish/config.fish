if status is-interactive
    # Commands to run in interactive sessions can go here

    set -g fish_greeting

    # abbreviations
    abbr -a mount2 'udisksctl mount -b /dev/sda2'
    abbr -a mount3 'udisksctl mount -b /dev/sda3'
    abbr -a umount2 'udisksctl unmount -b /dev/sda2'
    abbr -a umount3 'udisksctl unmount -b /dev/sda3'
    abbr -a mountall 'udisksctl mount -b /dev/sda2 && udisksctl mount -b /dev/sda3'
    abbr -a diskstatus 'udisksctl status'
end

# set editor
set -gx EDITOR vim
set -gx VISUAL vim

# set environment variables
fish_add_path $HOME/.local/bin

# COLOR PALETTE
fish_config theme choose "Rosé Pine"
# fish_config theme choose catppuccin-mocha --color-theme=dark
# fish_config theme choose "Dracula Official"
