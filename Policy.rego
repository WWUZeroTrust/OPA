import input
import users.json
import roles.json

default allow - false

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