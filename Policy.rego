import input
import Accounts.Users
import Categories.Roles

default allow - false
#https://github.com/open-policy-agent/opa/issues/1027
# role-permissions assignments
role_permissions := {
    "engineering":  [{"action": "read",  "object": "resource_1"}],
                    [{"action": "write", "object":"resource_1"}]        
}

# logic that implements RBAC.
default username = false
username {
    Users.username[i] == input.user
}

default role = false
role {
    Roles[j].username == username
}

