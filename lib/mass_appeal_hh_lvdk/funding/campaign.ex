defmodule MassAppealHhLvdk.Funding.Campaign do
  use Ecto.Schema

  schema "funding_campaigns" do
    field :canceled_at, :utc_datetime
    field :completed_at, :utc_datetime
    field :description, :string
    field :due_at, :utc_datetime
    field :name, :string
    field :total_funding_needed, :integer
    field :user_id, :integer

    timestamps()
  end
end
