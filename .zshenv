# add ccache wrappers around normal cc calls for faster compiles
export PATH="/usr/lib/ccache:$PATH"

# put local bin in front of path
export PATH="${HOME}/.local/bin:$PATH"

# add pyenv to path
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

