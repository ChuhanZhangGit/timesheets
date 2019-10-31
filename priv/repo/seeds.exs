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

Repo.insert!(%User{group: "manager", name: "Alice", email: "alice@example.com"})
Repo.insert!(%User{group: "worker", manager: "Alice", name: "Bob", email: "bob@example.com"})
Repo.insert!(%User{group: "worker", manager: "Alice", name: "Carol Anderson", email: "carol@example.com"})
Repo.insert!(%User{group: "worker", manager: "Alice", name: "Dave Anderson", email: "dave@example.com"})

Repo.insert!(%User{group: "manager", name: "test", email: "test", password_hash: pwhash})


