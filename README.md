# Terraform - Azure Web Scraping Infrastructure

## 🚀 About This Project

This project defines the infrastructure required to deploy a Web Scraping application on Azure using Terraform. While the original idea is focused on enabling web scraping workloads, the setup is essentially a general-purpose **Azure App Service** connected to a **SQL Database**, making it suitable for a wide range of backend applications.

It provisions two main components:  
- An **Azure App Service** (Windows/Linux) where the user’s application is deployed  
- An **Azure SQL Database**, cloned from an existing source for structured data storage

**Note:** No sample `.zip` is included. Users must provide their own application package and define the deployment command through the `appservice_command` variable (e.g., using `az webapp deploy`).

The project emphasizes reusability and automation, using modular Terraform code, externalized variables, and best practices for Infrastructure as Code (IaC). It is designed to be secure, flexible, and ready for production or development environments.

---

## 📁 Project Structure

```
.
├── main.tf                 # Terraform root module
├── variables.tf            # Variables and locals
├── outputs.tf              # Outputs
├── terraform.tfvars        # Values for variables
├── modules/
│   ├── Azure_AppService/   # App Service module
│   └── Azure_SQL/          # SQL Database module
└── JSON/                   # Config JSONs (e.g., for connection strings)
```

---

## ✅ Requirements

Before using this project, ensure you have:

- [Terraform](https://www.terraform.io/downloads) installed (recommended version: `~> 3.80.0` for azurerm provider)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) installed and authenticated
- Access to an Azure subscription with permissions to create resources (App Service, SQL, Resource Groups, etc.)

---

## ⚙️ Configuration Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-repo/azure-webscraping-infra.git
   cd azure-webscraping-infra
   ```

2. **Set your variables in `terraform.tfvars`:**
   Include values like:

   ```hcl
   connection_string_value = "your-sql-connection-string"
   resource_group_name     = "your-resource-group"
   location                = "eastus"
   sql_user                = "sqladmin"
   sql_password            = "SuperSecret123"
   sql_version             = "12.0"
   sql_tls_version         = "1.2"
   database_name           = "webscraperdb"
   creation_database_id    = "/subscriptions/.../source-db-id"
   sku_name                = "B1"
   os_type                 = "Windows"
   appservice_command      = "az webapp deploy --resource-group your-rg --name your-app --src-path ./dist/app.zip --type zip"
   ```

---

## 🔧 Configurable Variables

- `connection_string_value`: Connection string that includes the application name used to connect to the SQL database.  
- `resource_group_name`: Name of the Azure Resource Group where resources will be deployed.  
- `location`: Azure region where resources are hosted (e.g., `eastus`, `westeurope`).  
- `sql_password`: Administrator password for the SQL server (part of the resource environment).  
- `sql_user`: Administrator username for the SQL server (part of the resource environment).  
- `sql_version`: Version of the SQL engine used (e.g., `12.0`, `15.0`) – part of the resource environment.  
- `sql_tls_version`: Minimum TLS version required for secure SQL connections – defined in the resource environment.  
- `database_name`: Name of the SQL database to be created – part of the resource environment.  
- `creation_database_id`: Identifier or source template used to create the database (e.g., `Default`, `Sample`) – resource environment.  
- `sku_name`: The SKU (pricing tier) that defines the performance and capacity of the resource – resource environment.  
- `os_type`: Operating system type used for the service (e.g., `Linux`, `Windows`) – resource environment.  
- `appservice_command`: Path to the `.zip` package of your app used for deployment to Azure App Service – resource environment.  

---

## ▶️ Usage

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Preview the plan (double-check before deployment):**
   ```bash
   terraform plan
   ```

3. **Apply the infrastructure:**
   ```bash
   terraform apply
   ```

4. **Optional - Destroy when needed:**
   ```bash
   terraform destroy
   ```

---

## ☁️ What This Deploys

- Azure App Service (Windows/Linux, depending on `os_type`)
- Azure SQL Server (with TLS and secure access)
- A SQL database cloned from an existing source
- App Service deployment via CLI (`az webapp deploy` with a `.zip` package)

---

## 🏷 Resource Tags

All resources are tagged using a shared locals block to support resource management and billing:

- `created_by`: Carlos Escobar  
- `contact_dl`: carlos.escobar@example.com  
- `cost_center`: CloudOps  
- `env`: NDev  
- `created_date`: Automatically generated  

---

## 🔄 Maintenance Tips

To update or change infrastructure:

1. Edit your `.tf` or `.tfvars` files.
2. Run `terraform plan` to validate the change.
3. Apply it with `terraform apply`.

You can also redeploy your app using the `appservice_command` variable without re-running Terraform.

---

## 📬 Contact

For questions or support, feel free to reach out:  
📧 **carlosescobar08@proton.me**
