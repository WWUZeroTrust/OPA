#works here
user_roles := {
    "Sam": ["engineering", "webdev"],
    "Scar": ["engineering", "webdev"],
    "Josh": ["engineering", "webdev"],
    "John": ["hr","engineering","webdev"]
}

# role-permissions assignments
role_permissions := {
    "engineering": [{"action": "read",  "object": "server123", "score": "60"}],
    "webdev":      [{"action": "read",  "object": "server123", "score": "60"},
                    {"action": "write", "object": "server123", "score": "65"}],
    "hr":          [{"action": "read",  "object": "database456", "score": "70"}]
}

# logic that implements RBAC.
default allow = false

allow {
    # lookup the list of roles for the user
    roles := user_roles[input.user]
    
    # for each role in that list
    r := roles[_]

    # lookup the permissions list for role r
    permissions := role_permissions[r]
    
    # for each permission
    p := permissions[_]
    
    #
    # check if the permission granted to r matches the user's request
    # -------->  I need to check if input.score is >= score in role permissions  <-----------------
    p.action == input.action
    p.object == input.object
    to_number(input.score) >= to_number(p.score)
}

#Input:
#{
#    "action": "read",
#    "object": "server123",
#    "score": "55",
#    "user": "alice"
#}
