defmodule MassAppealHhLvdk.Web.CampaignController do
  use MassAppealHhLvdk.Web, :controller

  alias MassAppealHhLvdk.Funding

  def index(conn, _params) do
    campaigns = Funding.list_campaigns()
    render(conn, "index.json", campaigns: campaigns)
  end
end
