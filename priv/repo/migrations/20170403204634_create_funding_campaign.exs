defmodule MassAppealHhLvdk.Repo.Migrations.CreateMassAppealHhLvdk.Funding.Campaign do
  use Ecto.Migration

  def change do
    create table(:funding_campaigns) do
      add :name, :string
      add :description, :string
      add :total_funding_needed, :integer
      add :user_id, :integer
      add :due_at, :utc_datetime
      add :canceled_at, :utc_datetime
      add :completed_at, :utc_datetime

      timestamps()
    end

    create index(:funding_campaigns, [:user_id])
  end
end
