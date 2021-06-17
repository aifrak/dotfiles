import pytest

USER = "app-user"
GROUP = USER
HOME = "/home/" + USER
FONTS = HOME + "/.local/share/fonts"
DOT_ZSHRC = HOME + "/.zshrc"


@pytest.mark.order(1)
def test_install(host):
    install = host.run("./install --asdf --deps --elixir --fonts --zsh")
    zsh = host.run("zsh")

    assert install.succeeded
    assert zsh.succeeded


@pytest.mark.order(2)
@pytest.mark.parametrize(
    "name",
    [
        ("curl"),
        ("gnupg2"),
        ("nano"),
        ("make"),
        ("openssh-client"),
        ("wget"),
        ("xz-utils"),
        ("zsh"),
    ],
)
def test_packages(host, name):
    package = host.package(name)

    assert package.is_installed


@pytest.mark.order(2)
def test_home_directory():
    assert HOME == "/home/" + USER


@pytest.mark.order(2)
def test_asdf_installed(host):
    version = "v0.8.1"

    version_cmd = host.run(HOME + "/.asdf/bin/asdf --version")

    bashrc = host.file(HOME + "/.bashrc")

    assert version_cmd.succeeded
    assert version_cmd.stdout.startswith(version)
    assert bashrc.contains(rf"^. $HOME/.asdf/asdf.sh")
    assert bashrc.contains(rf"^. $HOME/.asdf/completions/asdf.bash")


@pytest.mark.order(2)
@pytest.mark.parametrize(
    "path, user, group",
    [
        (DOT_ZSHRC, USER, GROUP),
        (HOME + "/.p10k.zsh", USER, GROUP),
    ],
)
def test_copied_files(host, path, user, group):
    file = host.file(path)

    assert file.is_file
    assert file.user == user
    assert file.group == group


@pytest.mark.order(2)
@pytest.mark.parametrize(
    "font",
    [
        ("Fura Code Light Nerd Font Complete"),
        ("Fura Code Regular Nerd Font Complete"),
        ("Fura Code Medium Nerd Font Complete"),
        ("Fura Code Bold Nerd Font Complete"),
        ("Fura Code Retina Nerd Font Complete"),
    ],
)
def test_copied_fonts(host, font):
    file = host.file(FONTS + "/" + font + ".ttf")

    assert file.is_file
    assert file.user == USER
    assert file.group == GROUP


@pytest.mark.order(2)
@pytest.mark.parametrize(
    "variable_name",
    [
        ("dotfiles_elixir"),
    ],
)
def test_uncomment_zshrc_variables(host, variable_name):
    file = host.file(DOT_ZSHRC)

    assert file.contains(rf"^local {variable_name}=")
