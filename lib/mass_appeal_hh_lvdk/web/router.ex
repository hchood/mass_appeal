defmodule MassAppealHhLvdk.Web.Router do
  use MassAppealHhLvdk.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MassAppealHhLvdk.Web do
    pipe_through :api
  end
end
