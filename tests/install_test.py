import pytest

USER = "app-user"
GROUP = USER
HOME = "/home/" + USER
FONTS = HOME + "/.local/share/fonts"
DOT_BASHRC = HOME + "/.bashrc"
DOT_ZSHRC = HOME + "/.zshrc"


def __assert_zshrc_uncommented_variable(host, variable_name):
    assert host.file(DOT_ZSHRC).contains(rf"^local {variable_name}=1$")


def __assert_copied_dotfiles(host, path):
    file = host.file(path)

    assert file.is_file
    assert file.user == USER
    assert file.group == GROUP


@pytest.mark.order(1)
def test_install_deps(host):
    install = host.run(
        """
        ./install \
            --asdf \
            --deps \
            --docker \
            --elixir \
            --fonts \
            --wsl-gpg \
            --wsl-ssh \
            --zsh
        """
    )

    assert install.succeeded


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
    ],
)
def test_installed_deps_packages(host, name):
    assert host.package(name).is_installed


@pytest.mark.order(2)
def test_home_directory():
    assert HOME == "/home/" + USER


@pytest.mark.order(2)
def test_installed_zsh(host):
    assert host.package("zsh").is_installed
    assert host.run("zsh").succeeded
    __assert_copied_dotfiles(host, DOT_ZSHRC)
    __assert_copied_dotfiles(host, HOME + "/.p10k.zsh")


@pytest.mark.order(2)
@pytest.mark.parametrize(
    "variable_name",
    [
        ("dotfiles_elixir"),
        ("dotfiles_docker"),
    ],
)
def test_zsh_plugins_set_up(host, variable_name):
    __assert_zshrc_uncommented_variable(host, variable_name)


@pytest.mark.order(2)
def test_asdf_installed(host):
    version = "v0.9.0"

    version_cmd = host.run(HOME + "/.asdf/bin/asdf --version")

    bashrc = host.file(DOT_BASHRC)

    assert version_cmd.succeeded
    assert version_cmd.stdout.startswith(version)
    assert bashrc.contains(r"^. $HOME/.asdf/asdf.sh$")
    assert bashrc.contains(r"^. $HOME/.asdf/completions/asdf.bash$")


@pytest.mark.order(2)
def test_wsl_gpg_setup(host):
    gnupg_dir_path = HOME + "/.gnupg"
    gnupg_dir = host.file(gnupg_dir_path)
    gpg_agent_config = host.file(gnupg_dir_path + "/gpg-agent.conf")
    pinentry_path = "/mnt/c/Program Files (x86)/Gpg4win/bin/pinentry.exe"

    assert gnupg_dir.is_directory
    assert gnupg_dir.mode == 0o700
    assert gpg_agent_config.is_file
    assert gpg_agent_config.contains(f"^pinentry-program {pinentry_path}$")


@pytest.mark.order(2)
def test_wsl_ssh_setup(host):
    assert host.package("keychain").is_installed
    __assert_zshrc_uncommented_variable(host, "dotfiles_wsl_ssh")
    assert host.file(DOT_BASHRC).contains(
        r'^eval "$(keychain --eval --agents ssh id_rsa)"$'
    )


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
