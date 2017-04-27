defmodule MassAppealHhLvdk.FundingTest do
  use MassAppealHhLvdk.DataCase

  alias MassAppealHhLvdk.Funding
  alias MassAppealHhLvdk.Funding.Campaign

  @create_attrs %{canceled_at: %DateTime{calendar: Calendar.ISO, day: 17, hour: 14, microsecond: {0, 6}, minute: 0, month: 4, second: 0, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2010, zone_abbr: "UTC"}, completed_at: %DateTime{calendar: Calendar.ISO, day: 17, hour: 14, microsecond: {0, 6}, minute: 0, month: 4, second: 0, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2010, zone_abbr: "UTC"}, description: "some description", due_at: %DateTime{calendar: Calendar.ISO, day: 17, hour: 14, microsecond: {0, 6}, minute: 0, month: 4, second: 0, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2010, zone_abbr: "UTC"}, name: "some name", total_funding_needed: 42, user_id: 42}
  @update_attrs %{canceled_at: %DateTime{calendar: Calendar.ISO, day: 18, hour: 15, microsecond: {0, 6}, minute: 1, month: 5, second: 1, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2011, zone_abbr: "UTC"}, completed_at: %DateTime{calendar: Calendar.ISO, day: 18, hour: 15, microsecond: {0, 6}, minute: 1, month: 5, second: 1, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2011, zone_abbr: "UTC"}, description: "some updated description", due_at: %DateTime{calendar: Calendar.ISO, day: 18, hour: 15, microsecond: {0, 6}, minute: 1, month: 5, second: 1, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2011, zone_abbr: "UTC"}, name: "some updated name", total_funding_needed: 43, user_id: 43}
  @invalid_attrs %{canceled_at: nil, completed_at: nil, description: nil, due_at: nil, name: nil, total_funding_needed: nil, user_id: nil}

  def fixture(:campaign, attrs \\ @create_attrs) do
    {:ok, campaign} = Funding.create_campaign(attrs)
    campaign
  end

  test "list_campaigns/1 returns all campaigns" do
    campaign = fixture(:campaign)
    assert Funding.list_campaigns() == [campaign]
  end

  test "get_campaign! returns the campaign with given id" do
    campaign = fixture(:campaign)
    assert Funding.get_campaign!(campaign.id) == campaign
  end

  test "create_campaign/1 with valid data creates a campaign" do
    assert {:ok, %Campaign{} = campaign} = Funding.create_campaign(@create_attrs)
    assert campaign.canceled_at == %DateTime{calendar: Calendar.ISO, day: 17, hour: 14, microsecond: {0, 6}, minute: 0, month: 4, second: 0, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2010, zone_abbr: "UTC"}
    assert campaign.completed_at == %DateTime{calendar: Calendar.ISO, day: 17, hour: 14, microsecond: {0, 6}, minute: 0, month: 4, second: 0, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2010, zone_abbr: "UTC"}
    assert campaign.description == "some description"
    assert campaign.due_at == %DateTime{calendar: Calendar.ISO, day: 17, hour: 14, microsecond: {0, 6}, minute: 0, month: 4, second: 0, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2010, zone_abbr: "UTC"}
    assert campaign.name == "some name"
    assert campaign.total_funding_needed == 42
    assert campaign.user_id == 42
  end

  test "create_campaign/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Funding.create_campaign(@invalid_attrs)
  end

  test "update_campaign/2 with valid data updates the campaign" do
    campaign = fixture(:campaign)
    assert {:ok, campaign} = Funding.update_campaign(campaign, @update_attrs)
    assert %Campaign{} = campaign
    assert campaign.canceled_at == %DateTime{calendar: Calendar.ISO, day: 18, hour: 15, microsecond: {0, 6}, minute: 1, month: 5, second: 1, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2011, zone_abbr: "UTC"}
    assert campaign.completed_at == %DateTime{calendar: Calendar.ISO, day: 18, hour: 15, microsecond: {0, 6}, minute: 1, month: 5, second: 1, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2011, zone_abbr: "UTC"}
    assert campaign.description == "some updated description"
    assert campaign.due_at == %DateTime{calendar: Calendar.ISO, day: 18, hour: 15, microsecond: {0, 6}, minute: 1, month: 5, second: 1, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2011, zone_abbr: "UTC"}
    assert campaign.name == "some updated name"
    assert campaign.total_funding_needed == 43
    assert campaign.user_id == 43
  end

  test "update_campaign/2 with invalid data returns error changeset" do
    campaign = fixture(:campaign)
    assert {:error, %Ecto.Changeset{}} = Funding.update_campaign(campaign, @invalid_attrs)
    assert campaign == Funding.get_campaign!(campaign.id)
  end

  test "delete_campaign/1 deletes the campaign" do
    campaign = fixture(:campaign)
    assert {:ok, %Campaign{}} = Funding.delete_campaign(campaign)
    assert_raise Ecto.NoResultsError, fn -> Funding.get_campaign!(campaign.id) end
  end

  test "change_campaign/1 returns a campaign changeset" do
    campaign = fixture(:campaign)
    assert %Ecto.Changeset{} = Funding.change_campaign(campaign)
  end
end
