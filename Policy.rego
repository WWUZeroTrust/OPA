import input
import Users.Users
import roles.Roles

default allow - false
#https://github.com/open-policy-agent/opa/issues/1027
# role-permissions assignments
role_permissions := {
    "engineering":  [{"action": "read",  "object": "resource_1"}],
                    [{"action": "write", "object":"resource_1"}]        
}

# logic that implements RBAC.
default allow = false
allow {
    user = Users[input.user]
    role = 
}