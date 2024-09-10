# Create the role with the trust policy
# Executar na conta Control Plane
# Mudar o id da conta para a conta do Control Plane
# Mudar o OIDC do EKS

kubectl config use-context controlplane;

# Create the role with the trust policy
aws iam create-role --role-name control-plane-admin --assume-role-policy-document '{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::246732148991:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/4500275128BA0D196872A0BB05E310EB"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringLike": {
                    "oidc.eks.us-east-1.amazonaws.com/id/4500275128BA0D196872A0BB05E310EB:sub": "system:serviceaccount:crossplane-system:provider-aws-*"
                }
            }
        }
    ]
}'

# Mudar o id da conta para a conta do dataplane
# Attach the custom policy to the role
aws iam attach-role-policy --role-name control-plane-admin --policy-arn arn:aws:iam::aws:policy/AdministratorAccess