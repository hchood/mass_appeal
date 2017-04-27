defmodule MassAppealHhLvdk.Web.CampaignController do
  use MassAppealHhLvdk.Web, :controller

  alias MassAppealHhLvdk.Funding

  action_fallback MassAppealHhLvdk.Web.FallbackController

  def index(conn, _params) do
    campaigns = Funding.list_campaigns()
    render(conn, "index.json", campaigns: campaigns)
  end

  def show(conn, params) do
    campaign = Funding.get_campaign!(params["id"])
    render(conn, "show.json", campaign: campaign)
  end

  def create(conn, params) do
    with {:ok, campaign} <- Funding.create_campaign(params["campaign"])
      do conn
        |> put_status(:created)
        |> render("show.json", campaign: campaign)
    end
  end
end
