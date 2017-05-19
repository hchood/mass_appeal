defmodule MassAppealHhLvdk.Account.User do
  use Ecto.Schema

  alias MassAppealHhLvdk.Funding.Pledge

  schema "account_users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string

    timestamps()

    has_many :funding_pledges, Pledge
  end
end
