defmodule MassAppealHhLvdk.Repo.Migrations.CreateMassAppealHhLvdk.Funding.Pledge do
  use Ecto.Migration

  def change do
    create table(:funding_pledges) do
      add :amount_cents, :integer, null: false
      add :user_id, references(:account_users, on_delete: :nothing), null: false
      add :campaign_id, references(:funding_campaigns, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:funding_pledges, [:user_id])
    create index(:funding_pledges, [:campaign_id])
  end
end
