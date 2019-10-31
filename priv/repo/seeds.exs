# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Timesheets.Repo.insert!(%Timesheets.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Timesheets.Repo
alias Timesheets.Users.User

pwhash = Argon2.hash_pwd_salt("1")

Repo.insert!(%User{id: 1, group: "manager", name: "Alice", email: "alice@example.com"})
Repo.insert!(%User{id: 5, group: "manager", name: "test", email: "test", password_hash: pwhash})
Repo.insert!(%User{id: 2, group: "worker", manager_id: 1, name: "Bob", email: "bob@example.com"})
Repo.insert!(%User{id: 3, group: "worker", manager_id: 1, name: "Carol Anderson", email: "carol@example.com"})
Repo.insert!(%User{id: 4, group: "worker", manager_id: 5, name: "Dave Anderson", email: "dave@example.com"})




