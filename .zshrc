# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(
  git
  kubectl
  zsh-z
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
  helm
  kops
  minikube
  terraform
  python
  vault
  history-substring-search
  zsh-syntax-highlighting
)

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"


source $ZSH/oh-my-zsh.sh

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZSH/fzf-tab/fzf-tab.plugin.zsh
#source $ZSH/fzf-tab-completion/zsh/fzf-zsh-completion.sh
#bindkey '^I' fzf_completion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/Cellar/packer/1.8.1/libexec/bin/packer packer
