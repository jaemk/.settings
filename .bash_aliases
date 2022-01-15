shopt -s expand_aliases

if command -v exa >/dev/null 2>&1; then
    alias ls='exa'
fi
if command -v watchexec >/dev/null 2>&1; then
    alias we='watchexec'
fi
if command -v docker-compose >/dev/null 2>&1; then
    alias dcomp='docker-compose'
fi
if command -v nvim >/dev/null 2>&1; then
    alias vim='nvim'
fi

alias sc='sudo systemctl'
alias l='ls'
# make destructive things interactive
alias ll='ls -l'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

## paste helpers
# copy from stdin or a file
alias pc='~/.settings/pc.sh'
# paste from a url or code
alias pp='~/.settings/pp.sh'

# curl with timing
alias curltime='~/.settings/curltime.sh'

# kube aliases
#alias wk="watch -n1 kubectl get pods"
#alias k="kubectl"
#alias mfa="~/.install/aws-mfa/bin/aws-mfa"
#alias kc="kubectx"
#alias unprod="kubectx non-prod"
#alias prod="kubectx prod; kubens core-services"
#alias dev="kubectx non-prod; kubens core-services-dev"
#alias staging="kubectx non-prod; kubens core-services-staging"
#alias providers-prod="kubectx prod; kubens providers"
#alias providers-staging="kubectx non-prod; kubens providers-staging"
#alias providers-dev="kubectx non-prod; kubens providers-dev"
#alias mk="kubectx minikube"
#alias kom="kubectx do-nyc1-kom; kubens default"
#alias kom-refresh-cert="doctl kubernetes cluster kubeconfig save kom"
