module "anzx_cards" {
  source       = "./modules/project"
  project_name = "anzx-cards"
}

module "anzx_transactions" {
  source       = "./modules/project"
  project_name = "anzx-transactions"
}

module "anzx_payments" {
  source       = "./modules/project"
  project_name = "anzx-payments"
}

module "anzx_accounts_goals" {
  source       = "./modules/project"
  project_name = "anzx-accounts-goals"
}

module "anzx_plat_test" {
  source       = "./modules/project"
  project_name = "anzx-plat-test"
}
