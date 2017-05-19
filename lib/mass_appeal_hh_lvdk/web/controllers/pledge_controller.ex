defmodule MassAppealHhLvdk.Web.PledgeController do
  use MassAppealHhLvdk.Web, :controller

  alias MassAppealHhLvdk.Funding

  action_fallback MassAppealHhLvdk.Web.FallbackController

  def create(conn, params) do
    with {:ok, pledge} <- Funding.create_pledge(params["pledge"])
      do conn
        |> put_status(:created)
        |> render("show.json", pledge: pledge)
    end
  end
end
