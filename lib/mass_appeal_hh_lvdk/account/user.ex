defmodule MassAppealHhLvdk.Account.User do
  use Ecto.Schema

  schema "account_users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end
end
