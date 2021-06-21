import pytest

USER = "app-user"
GROUP = USER
HOME = "/home/" + USER
FONTS = HOME + "/.local/share/fonts"
DOT_BASHRC = HOME + "/.bashrc"
DOT_ZSHRC = HOME + "/.zshrc"


@pytest.mark.order(3)
def test_uninstall(host):
    cmd = host.run("./uninstall")

    assert cmd.succeeded


@pytest.mark.order(4)
def test_asdf_uninstalled(host):
    version_cmd = host.run(HOME + "/.asdf/bin/asdf --version")

    dot_bashrc = host.file(DOT_BASHRC)

    assert not version_cmd.succeeded
    assert not dot_bashrc.contains(rf"^. $HOME/.asdf/asdf.sh")
    assert not dot_bashrc.contains(rf"^. $HOME/.asdf/completions/asdf.bash")


@pytest.mark.order(4)
@pytest.mark.parametrize("path", [(HOME + "/.cache/gitstatus")])
def test_gitstatus_uninstall(host, path):
    directory = host.file(path)

    assert not directory.exists


@pytest.mark.order(4)
@pytest.mark.parametrize(
    "path",
    [
        # zinit
        (DOT_ZSHRC),
        (HOME + "/.zinit"),
        (HOME + "/.p10k.zsh"),
        # fonts
        (FONTS + "/Fura Code Light Nerd Font Complete.ttf"),
        (FONTS + "/Fura Code Regular Nerd Font Complete.ttf"),
        (FONTS + "/Fura Code Medium Nerd Font Complete.ttf"),
        (FONTS + "/Fura Code Bold Nerd Font Complete.ttf"),
        (FONTS + "/Fura Code Retina Nerd Font Complete.ttf"),
    ],
)
def test_removed_files(host, path):
    assert not host.file(path).exists


@pytest.mark.order(4)
@pytest.mark.parametrize(
    "path",
    [
        # asdf
        (HOME + "/.asdf"),
        # zinit
        (HOME + "/.cache/p10k-" + USER),
        (HOME + "/.config/lsd"),
        (HOME + "/.config/znt"),
    ],
)
@pytest.mark.order(4)
def test_removed_directories(host, path):
    directory = host.file(path)

    assert not directory.exists
