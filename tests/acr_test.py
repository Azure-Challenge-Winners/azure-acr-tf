import unittest
from runner import Runner


class TestE2E(unittest.TestCase):
  @classmethod
  def setUpClass(self):
    self.snippet = """
            provider "azurerm" {
              subscription_id = "null"
              client_id = "null"
              client_secret = "null"
              tenant_id = "null"
              skip_credentials_validation = true
            }

            module "acr" {

              source = "./mymodule"

              resource_group {
                name = "team5rg"
              }

              location = "East US"

              storage_account {
                name = "team5sa"
                account_tier = "Standard"
                account_replication_type = "GRS"
              }

              container_registry {
                name = "team5ca"
                admin_enabled = "true"
                sku = "Classic"
              }


        """
    self.result = Runner(self.snippet).result

  def test_root_destroy(self):
    self.assertEqual(self.result["destroy"], False)
    self.assertEqual(self.result["acr"]["destroy"], False)

if __name__ == '__main__':
  unittest.main()
