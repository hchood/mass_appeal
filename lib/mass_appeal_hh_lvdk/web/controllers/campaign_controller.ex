defmodule MassAppealHhLvdk.Web.CampaignController do
  use MassAppealHhLvdk.Web, :controller

  def index(conn, _params) do
    campaigns = [%{"id" => 1, "name" => "zip line to Rogers"}]
    render(conn, "index.json", campaigns: campaigns)
  end
end
