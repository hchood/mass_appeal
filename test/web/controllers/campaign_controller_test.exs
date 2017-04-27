defmodule MassAppealHhLvdk.Web.CampaignControllerTest do
  use MassAppealHhLvdk.Web.ConnCase

  alias MassAppealHhLvdk.Funding
  alias MassAppealHhLvdk.Funding.Campaign

  @create_attrs %{canceled_at: %DateTime{calendar: Calendar.ISO, day: 17, hour: 14, microsecond: {0, 6}, minute: 0, month: 4, second: 0, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2010, zone_abbr: "UTC"}, completed_at: %DateTime{calendar: Calendar.ISO, day: 17, hour: 14, microsecond: {0, 6}, minute: 0, month: 4, second: 0, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2010, zone_abbr: "UTC"}, description: "some description", due_at: %DateTime{calendar: Calendar.ISO, day: 17, hour: 14, microsecond: {0, 6}, minute: 0, month: 4, second: 0, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2010, zone_abbr: "UTC"}, name: "some name", total_funding_needed: 42, user_id: 42}
  @update_attrs %{canceled_at: %DateTime{calendar: Calendar.ISO, day: 18, hour: 15, microsecond: {0, 6}, minute: 1, month: 5, second: 1, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2011, zone_abbr: "UTC"}, completed_at: %DateTime{calendar: Calendar.ISO, day: 18, hour: 15, microsecond: {0, 6}, minute: 1, month: 5, second: 1, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2011, zone_abbr: "UTC"}, description: "some updated description", due_at: %DateTime{calendar: Calendar.ISO, day: 18, hour: 15, microsecond: {0, 6}, minute: 1, month: 5, second: 1, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2011, zone_abbr: "UTC"}, name: "some updated name", total_funding_needed: 43, user_id: 43}
  @invalid_attrs %{canceled_at: nil, completed_at: nil, description: nil, due_at: nil, name: nil, total_funding_needed: nil, user_id: nil}

  def fixture(:campaign) do
    {:ok, campaign} = Funding.create_campaign(@create_attrs)
    campaign
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, campaign_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "creates campaign and renders campaign when data is valid", %{conn: conn} do
    conn = post conn, campaign_path(conn, :create), campaign: @create_attrs
    assert %{"id" => id} = json_response(conn, 201)["data"]

    conn = get conn, campaign_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "canceled_at" => %DateTime{calendar: Calendar.ISO, day: 17, hour: 14, microsecond: {0, 6}, minute: 0, month: 4, second: 0, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2010, zone_abbr: "UTC"},
      "completed_at" => %DateTime{calendar: Calendar.ISO, day: 17, hour: 14, microsecond: {0, 6}, minute: 0, month: 4, second: 0, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2010, zone_abbr: "UTC"},
      "description" => "some description",
      "due_at" => %DateTime{calendar: Calendar.ISO, day: 17, hour: 14, microsecond: {0, 6}, minute: 0, month: 4, second: 0, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2010, zone_abbr: "UTC"},
      "name" => "some name",
      "total_funding_needed" => 42,
      "user_id" => 42}
  end

  test "does not create campaign and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, campaign_path(conn, :create), campaign: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates chosen campaign and renders campaign when data is valid", %{conn: conn} do
    %Campaign{id: id} = campaign = fixture(:campaign)
    conn = put conn, campaign_path(conn, :update, campaign), campaign: @update_attrs
    assert %{"id" => ^id} = json_response(conn, 200)["data"]

    conn = get conn, campaign_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "canceled_at" => %DateTime{calendar: Calendar.ISO, day: 18, hour: 15, microsecond: {0, 6}, minute: 1, month: 5, second: 1, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2011, zone_abbr: "UTC"},
      "completed_at" => %DateTime{calendar: Calendar.ISO, day: 18, hour: 15, microsecond: {0, 6}, minute: 1, month: 5, second: 1, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2011, zone_abbr: "UTC"},
      "description" => "some updated description",
      "due_at" => %DateTime{calendar: Calendar.ISO, day: 18, hour: 15, microsecond: {0, 6}, minute: 1, month: 5, second: 1, std_offset: 0, time_zone: "Etc/UTC", utc_offset: 0, year: 2011, zone_abbr: "UTC"},
      "name" => "some updated name",
      "total_funding_needed" => 43,
      "user_id" => 43}
  end

  test "does not update chosen campaign and renders errors when data is invalid", %{conn: conn} do
    campaign = fixture(:campaign)
    conn = put conn, campaign_path(conn, :update, campaign), campaign: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen campaign", %{conn: conn} do
    campaign = fixture(:campaign)
    conn = delete conn, campaign_path(conn, :delete, campaign)
    assert response(conn, 204)
    assert_error_sent 404, fn ->
      get conn, campaign_path(conn, :show, campaign)
    end
  end
end
