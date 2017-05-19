defmodule MassAppealHhLvdk.Funding.Pledge do
  use Ecto.Schema

  schema "funding_pledges" do
    field :amount_cents, :integer
    field :user_id, :id
    field :campaign_id, :id

    timestamps()
  end
end
