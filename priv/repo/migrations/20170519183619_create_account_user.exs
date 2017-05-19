defmodule MassAppealHhLvdk.Repo.Migrations.CreateMassAppealHhLvdk.Account.User do
  use Ecto.Migration

  def change do
    create table(:account_users) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :email, :string, null: false

      timestamps()
    end

    create unique_index(:account_users, [:email])
  end
end
