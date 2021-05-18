import os
import platform

import pytest
import testinfra

ROOT = 'root'
USER = 'dev-user'
GROUP = 'dev-user'
HOME = '/home/' + USER
FONTS = HOME + '/.local/share/fonts'
ZSH = HOME + '/.oh-my-zsh'


@pytest.mark.order(1)
def test_zsh(host):
    cmd = host.run('zsh')

    assert cmd.succeeded


@pytest.mark.order(2)
@pytest.mark.parametrize('name, version', [
    ('gnupg2', '2.2.12'),
    ('lsd', '0.17.0'),
    ('make', '4.2.1-1.2'),
    ('openssh-client', '1:7.9p1'),
    ('wget', '1.20.1'),
    ('xz-utils', '5.2.4'),
    ('zsh', '5.7.1'),
])
def test_packages(host, name, version):
    package = host.package(name)

    assert package.is_installed
    if version:
        assert package.version.startswith(version)


@pytest.mark.order(2)
def test_home_directory(host):
    assert HOME == '/home/' + USER


@pytest.mark.order(2)
@pytest.mark.parametrize('name, version', [
    ('hadolint', '2.1.0'),
    ('node', '14.16.0'),
    ('npm', '6.14.11'),
    ('npx', '6.14.11'),
    ('shellcheck', '0.7.1'),
    ('shfmt', '3.2.4'),
])
def test_binaries(host, name, version):
    binary_version_cmd = host.run(name + ' --version')

    assert binary_version_cmd.succeeded
    assert version in binary_version_cmd.stdout


@pytest.mark.order(2)
def test_fzf_installed(host):
    fzf_version_cmd = host.run(HOME + '/.fzf/bin/fzf --version')
    fzf_dir = host.file(HOME + '/.fzf')

    assert fzf_version_cmd.succeeded
    assert fzf_version_cmd.stdout.startswith('0.21.1')

    assert fzf_dir.is_directory
    assert len(fzf_dir.listdir()) > 0
    assert fzf_dir.user == USER
    assert fzf_dir.group == GROUP


@pytest.mark.order(2)
@pytest.mark.parametrize('path, user, group', [
    (ZSH + '/custom/plugins/zsh-syntax-highlighting', USER, GROUP),
    (ZSH + '/custom/plugins/zsh-autosuggestions', USER, GROUP),
    (ZSH + '/custom/themes/powerlevel10k', USER, GROUP),
])
def test_installed_plugin_directories(host, path, user, group):
    file = host.file(path)

    assert file.is_directory
    assert len(file.listdir()) > 0
    assert file.user == user
    assert file.group == group


@pytest.mark.order(2)
def test_gitstatus(host):
    path = HOME + '/.cache/gitstatus/gitstatusd-linux-x86_64'
    file = host.file(path)

    assert file.is_file
    assert file.user == USER
    assert file.group == GROUP


@pytest.mark.order(2)
@pytest.mark.parametrize('path, user, group', [
    (HOME + '/.zshenv', USER, GROUP),
    (HOME + '/.zshrc', USER, GROUP),
    (HOME + '/.p10k.zsh', USER, GROUP),
    (HOME + '/.oh-my-zsh/custom/aliases.zsh', USER, GROUP),
])
def test_copied_files(host, path, user, group):
    file = host.file(path)

    assert file.is_file
    assert file.user == user
    assert file.group == group


@pytest.mark.order(2)
@pytest.mark.parametrize('path, user, group', [
    (HOME + '/.cache', USER, GROUP),
])
def test_copied_directories(host, path, user, group):
    directory = host.file(path)

    assert directory.is_directory
    assert directory.user == user
    assert directory.group == group


@pytest.mark.order(2)
@pytest.mark.parametrize('font', [
    ('Fura Code Light Nerd Font Complete'),
    ('Fura Code Regular Nerd Font Complete'),
    ('Fura Code Medium Nerd Font Complete'),
    ('Fura Code Bold Nerd Font Complete'),
    ('Fura Code Retina Nerd Font Complete'),
])
def test_copied_fonts(host, font):
    file = host.file(FONTS + '/' + font + '.ttf')

    assert file.is_file
    assert file.user == USER
    assert file.group == GROUP


@pytest.mark.order(2)
@pytest.mark.parametrize('plugin', [
    ('mix'),
    ('mix-fast'),
])
def test_enabled_elixir_plugins(host, plugin):
    zshrc = host.file(HOME + '/.zshrc')

    assert zshrc.contains(rf'^  {plugin}$')


@pytest.mark.order(2)
@pytest.mark.parametrize('env_var', [
    ('ERL_AFLAGS'),
])
def test_enabled_elixir_env_vars(host, env_var):
    zshenv = host.file(HOME + '/.zshenv')

    assert zshenv.contains(rf'^export {env_var}=')
