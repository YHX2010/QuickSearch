sudo -H apt-get install -y python3-dev python3-babel python3-venv uwsgi uwsgi-plugin-python3 git build-essential libxslt-dev zlib1g-dev libffi-dev libssl-dev
sudo -H useradd --shell /bin/bash --system --home-dir "/usr/local/searxng" --comment 'Privacy-respecting metasearch engine' searxng
sudo -H mkdir "/usr/local/searxng"
sudo -H chown -R "searxng:searxng" "/usr/local/searxng"
python3 -m venv "/usr/local/searxng/searx-pyenv"
echo ". /usr/local/searxng/searx-pyenv/bin/activate" >>  "/usr/local/searxng/.profile"
sudo -H -u searxng -i
command -v python && python --version
pip install -U pip
pip install -U setuptools
pip install -U wheel
pip install -U pyyaml
pip install -e .
export SEARXNG_SETTINGS_PATH="./utils/templates/etc/searxng/settings.yml"
python ./searx/webapp.py
