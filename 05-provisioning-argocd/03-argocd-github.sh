# Integração do ArgoCD com o Github

export GITHUB_PAT=xxxxx
export URL_REPO=xxxxxx
export GITHUB_USERNAME=xxxx

kubectl apply -f - <<EOF
---
apiVersion: v1
kind: Secret
metadata:
  name: argocd-github-credentials
  namespace: argocd
  labels:
    argocd.argoproj.io/secret-type: repository
type: Opaque
stringData:
  name: argocd-github
  url: ${URL_REPO}
  username: ${GITHUB_USERNAME}
  password: ${GITHUB_PAT}
EOF

