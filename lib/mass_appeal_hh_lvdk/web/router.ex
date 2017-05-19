defmodule MassAppealHhLvdk.Web.Router do
  use MassAppealHhLvdk.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/v1", MassAppealHhLvdk.Web do
    pipe_through :api
    resources "/campaigns", CampaignController, only: [:index, :show, :create] do
      resources "/pledges", PledgeController, only: [:create]
    end
  end
end
