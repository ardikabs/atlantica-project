
#-----------------------------------
# Google Cloud Platform
#-----------------------------------

prefix_name = "kube"

project = {
  name = "production-257013"
  region = "asia-southeast1"
  credential = "accounts.json"

}

kubernetes = {
  master = {
    count = 3
    machine_type = "n1-standard-2"
  }
  worker = {
    count = 3
    machine_type = "n1-standard-2"
  }
}
