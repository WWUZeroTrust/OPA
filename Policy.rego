import input
import Accounts.Users
import Categories.Roles

#https://github.com/open-policy-agent/opa/issues/1027
#https://medium.com/@mathurvarun98/how-to-write-great-rego-policies-dc6117679c9f
# role-permissions assignments
role_permissions := {
    "engineering":  [{"action": "read",  "object": "resource_1"}],
                    [{"action": "write", "object":"resource_1"}]        
}

default username = false
#Just grabs the usernames. Using this to varify the user exists in the API call
account[username] { 
    username = Users[_].username
}

default permissions = false
#We need to find Roles[i]. This is what group a user is in. 
#.username[account[input.user]] is grabbing the groups that the user is in from input.user (from api call) 
permissions[access]{
    some i
    access := Roles[i].username[account[input.user]]
}

