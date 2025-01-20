#!/bin/bash

set -e  # 開啟錯誤檢查，一旦指令失敗，腳本將停止執行

function rollback {
    echo "An error occurred. Rolling back changes..."
    pyenv uninstall -f 3.11.6 || true
    rm -rf ~/.pyenv || true
    sudo apt remove --purge -y curl git build-essential libssl-dev zlib1g-dev libbz2-dev \
      libreadline-dev libsqlite3-dev wget llvm libncurses5-dev libncursesw5-dev \
      xz-utils tk-dev libffi-dev liblzma-dev || true
    sudo apt autoremove -y || true
    echo "Rollback completed."
    exit 1
}

trap rollback ERR  # 設定錯誤捕捉，當任一指令失敗時執行 rollback

# 更新並升級系統
sudo apt update && sudo apt upgrade -y

# 安裝必要的工具和依賴
sudo apt install -y \
  curl git build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget llvm libncurses5-dev libncursesw5-dev \
  xz-utils tk-dev libffi-dev liblzma-dev

# 安裝 pyenv
if ! command -v pyenv &> /dev/null
then
    echo "Installing pyenv..."
    curl https://pyenv.run | bash
else
    echo "pyenv is already installed. Skipping installation."
fi

# 設定 pyenv 環境變數
if [[ -f ~/.bashrc ]]; then
    SHELL_RC=~/.bashrc
elif [[ -f ~/.zshrc ]]; then
    SHELL_RC=~/.zshrc
else
    SHELL_RC=~/.bashrc
fi

grep -qxF 'export PYENV_ROOT="$HOME/.pyenv"' $SHELL_RC || echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $SHELL_RC
grep -qxF 'export PATH="$PYENV_ROOT/bin:$PATH"' $SHELL_RC || echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $SHELL_RC
grep -qxF 'eval "$(pyenv init --path)"' $SHELL_RC || echo 'eval "$(pyenv init --path)"' >> $SHELL_RC
grep -qxF 'eval "$(pyenv init -)"' $SHELL_RC || echo 'eval "$(pyenv init -)"' >> $SHELL_RC

# 重新加載配置檔案
source $SHELL_RC

# 驗證 pyenv 安裝是否成功
if command -v pyenv &> /dev/null
then
    echo "pyenv installed successfully: $(pyenv --version)"
else
    echo "pyenv installation failed. Please check the steps."
    exit 1
fi

# 安裝指定版本的 Python
PYTHON_VERSION="3.11.6"
echo "Installing Python $PYTHON_VERSION using pyenv..."
pyenv install -s $PYTHON_VERSION
pyenv global $PYTHON_VERSION

# 驗證 Python 安裝是否成功
if python --version | grep -q $PYTHON_VERSION
then
    echo "Python $PYTHON_VERSION installed successfully."
else
    echo "Python installation failed. Please check the steps."
    exit 1
fi

# 安裝 FastAPI 和推薦工具
pip install --upgrade pip
pip install fastapi uvicorn pydantic

# 驗證 FastAPI 安裝是否成功
if pip show fastapi &> /dev/null
then
    echo "FastAPI installed successfully."
else
    echo "FastAPI installation failed. Please check the steps."
    exit 1
fi

# 最後提示
echo "\nInstallation completed successfully!\n"
echo "Installed components:"
echo "- pyenv: $(pyenv --version)"
echo "- Python: $(python --version)"
echo "- FastAPI: $(pip show fastapi | grep Version | awk '{print $2}')"
echo "- Additional tools: uvicorn, pydantic"

# 結束
