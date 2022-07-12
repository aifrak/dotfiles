import pytest

USER = "app-user"
GROUP = USER
HOME = "/home/" + USER
FONTS = HOME + "/.local/share/fonts"
DOT_BASHRC = HOME + "/.bashrc"
DOT_ZSHRC = HOME + "/.zshrc"


@pytest.mark.order(3)
def test_uninstall(host):
    assert host.run("./uninstall").succeeded


@pytest.mark.order(4)
def test_uninstalled_asdf(host):
    bashrc = host.file(DOT_BASHRC)

    assert not host.file(HOME + "/.asdf").exists
    assert not host.run(HOME + "/.asdf/bin/asdf --version").succeeded
    assert not bashrc.contains(r"^. $HOME/.asdf/asdf.sh$")
    assert not bashrc.contains(r"^. $HOME/.asdf/completions/asdf.bash$")


@pytest.mark.order(4)
def test_uninstalled_zsh(host):
    assert not host.package("zsh").is_installed
    assert not host.file(HOME + "/.cache/gitstatus").exists
    assert not host.file(HOME + "/.cache/p10k-" + USER).exists
    assert not host.file(HOME + "/.config/lsd").exists
    assert not host.file(HOME + "/.config/znt").exists
    assert not host.file(DOT_ZSHRC).exists
    assert not host.file(HOME + "/.zinit").exists
    assert not host.file(HOME + "/.p10k.zsh").exists


@pytest.mark.order(4)
@pytest.mark.parametrize(
    "path",
    [
        (FONTS + "/Fura Code Light Nerd Font Complete.ttf"),
        (FONTS + "/Fura Code Regular Nerd Font Complete.ttf"),
        (FONTS + "/Fura Code Medium Nerd Font Complete.ttf"),
        (FONTS + "/Fura Code Bold Nerd Font Complete.ttf"),
        (FONTS + "/Fura Code Retina Nerd Font Complete.ttf"),
    ],
)
def test_uninstalled_fonts(host, path):
    assert not host.file(path).exists


@pytest.mark.order(4)
def test_removed_wsl_gpg(host):
    assert not host.file(HOME + "/.gnupg/gpg-agent.conf").exists


@pytest.mark.order(4)
def test_removed_wsl_ssh(host):
    assert not host.package("keychain").is_installed
    assert not host.file(HOME + "/.keychain").exists
    assert not host.file(DOT_BASHRC).contains(
        r'^eval "$(keychain --eval --agents ssh id_rsa)"$'
    )
