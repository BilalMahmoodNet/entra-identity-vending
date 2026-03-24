# Azure IAM & RBAC Vending Machine

A production-grade Terraform solution for automated "Birthright" provisioning. This project orchestrates **Microsoft Entra ID (Identity)** and **Azure Resource Manager (Permissions)** to provide a zero-touch onboarding experience for engineering teams.

## 🏗️ The Problem
In large enterprises, creating a new team usually involves manual, ticket-based steps:
1. Creating a Security Group.
2. Adding owners/members.
3. Assigning "Reader" or "Contributor" roles at the Subscription/RG level.

This manual process leads to **naming inconsistencies**, **permission drift**, and **security gaps**.

## 🚀 The Solution
This "Vending Machine" uses Terraform to:
- **Scale Dynamically:** Create teams via a single `team_names` list variable.
- **Enforce Governance:** Automatically applies a standard naming convention (`Vending-TeamName-Env-GRP`).
- **Bridge Cloud Layers:** Links Entra ID Groups to Subscription-level RBAC roles using immutable GUIDs.
- **Ensure Portability:** Uses a "Partial Backend" configuration, allowing the module to be deployed into any environment (Dev, Test, Prod).

## 🛠️ Prerequisites
- **Azure CLI** installed and authenticated (`az login`).
- **Permissions:** `User.ReadWrite.All` (Entra ID) and `Role Management` (Subscription).
- **Terraform** 1.0.0 or higher.

## 💻 How to Use (Step-by-Step)

### 1. Initialize the Backend
Since this project uses a "Partial Backend" for security, you must provide your storage details during initialization:

```bash
terraform init \
  -backend-config="resource_group_name=<YOUR_RG>" \
  -backend-config="storage_account_name=<YOUR_STORAGE_ACCOUNT>" \
  -backend-config="container_name=tfstate" \
  -backend-config="key=iam-vending.tfstate"

**### 2. How  to Use This Now**

Clone repo, run `az login`, and then run `terraform init` with **town** storage account. 


