# Github-Pipeline — Terraform Azure CI pipeline (practice)

This repository contains a minimal Terraform project and a GitHub Actions workflow to run `terraform fmt`, `terraform validate`, and `terraform plan` against Azure using OIDC / `azure/login`.

Quick start (local):

```bash
# install terraform (>= 1.5.0)
terraform init
terraform validate
terraform plan
```

Create a feature branch and push:

```bash
git checkout -b feature/terraform-pipeline
git add .
git commit -m "Add Terraform GitHub Actions pipeline"
git push origin feature/terraform-pipeline
```

Setup in GitHub:
- Add repository secrets: `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`.
- Optionally configure a federated credential in your App registration for OIDC (issuer: `https://token.actions.githubusercontent.com`, audience: `api://AzureADTokenExchange`).

Files of interest:
- `provider.tf`, `main.tf`, `variables.tf`, `outputs.tf`, `terraform.tfvars`
- Workflow: `.github/workflows/terraform.yml`

Do NOT enable `terraform apply` on feature branches. Review `terraform plan` first and add an `apply` step that only runs on `refs/heads/main` after PR merge.
