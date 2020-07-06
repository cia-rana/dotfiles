[[ -f ~/.bashrc ]] && source ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/s06111/google-cloud-sdk/path.bash.inc' ]; then . '/Users/s06111/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/s06111/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/s06111/google-cloud-sdk/completion.bash.inc'; fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export BASH_SILENCE_DEPRECATION_WARNING=1
