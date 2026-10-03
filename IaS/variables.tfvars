workspaces = ["default", "dev", "qa"]

puertos = {
  default = {
    web = 3000
    api = 3001
    bd  = 3002
  }
  dev = {
    web = 4001
    api = 4002
    bd  = 4003
  }
  qa = {
    web = 5001
    api = 5002
    bd  = 5003
  }
}