import os
import platform

import pytest
import testinfra

ROOT = 'root'
BIN = '/usr/local/bin'
USER = 'dev-user'
GROUP = 'dev-user'
HOME = '/home/' + USER
FONTS = HOME + '/.local/share/fonts'
ZSH = HOME + '/.oh-my-zsh'


@pytest.mark.order(3)
def test_uninstall(host):
    with host.sudo():
        cmd = host.run('./uninstall ' + USER)

        assert cmd.succeeded


@pytest.mark.order(4)
@pytest.mark.parametrize('name', [
    ('zsh'),
    ('lsd'),
])
def test_uninstalled_packages(host, name):
    package = host.package(name)

    assert not package.is_installed


@pytest.mark.order(4)
@pytest.mark.parametrize('command, path', [
    ('hadolint --version', BIN + '/hadolint'),
    ('shellcheck --version', BIN + '/shellcheck'),
    ('shfmt --version', BIN + '/shfmt'),
])
def test_uninstalled_binaries(host, command, path):
    binary_version_cmd = host.run(command)
    file = host.file(path)

    assert not binary_version_cmd.succeeded
    assert not file.exists


@pytest.mark.order(4)
def test_uninstalled_fzf(host):
    fzf_version_cmd = host.run(HOME + '/.fzf/bin/fzf --version')
    fzf_dir = host.file(HOME + '/.fzf')

    assert not fzf_version_cmd.succeeded
    assert not fzf_dir.exists


@pytest.mark.order(4)
@pytest.mark.parametrize('path', [
    (HOME + '/.cache/gitstatus')
])
def test_uninstall_gitstatus(host, path):
    directory = host.file(path)

    assert not directory.exists


@pytest.mark.order(4)
@pytest.mark.parametrize('path', [
    (HOME + '/.z'),
    (HOME + '/.zshenv'),
    (HOME + '/.zshrc'),
    (HOME + '/.p10k.zsh'),
    (HOME + '/.oh-my-zsh/custom/aliases.zsh'),
    (FONTS + '/Fura Code Light Nerd Font Complete.ttf'),
    (FONTS + '/Fura Code Regular Nerd Font Complete.ttf'),
    (FONTS + '/Fura Code Medium Nerd Font Complete.ttf'),
    (FONTS + '/Fura Code Bold Nerd Font Complete.ttf'),
    (FONTS + '/Fura Code Retina Nerd Font Complete.ttf'),
])
def test_removed_files(host, path):
    assert not host.file(path).exists


@pytest.mark.order(4)
@pytest.mark.parametrize('path', [
    (HOME + '/.oh-my-zsh'),
    (HOME + '/.cache/p10k-' + USER),
    (HOME + '/.config/znt'),
])
@pytest.mark.order(4)
def test_removed_directories(host, path):
    directory = host.file(path)

    assert not directory.exists
