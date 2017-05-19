defmodule MassAppealHhLvdk.Web.PledgeView do
  use MassAppealHhLvdk.Web, :view

  alias MassAppealHhLvdk.Web.PledgeView

  def render("index.json", %{pledges: pledges}) do
    %{data: render_many(pledges, PledgeView, "show.json")}
  end

  def render("show.json", %{pledge: pledge}) do
  %{
    id: pledge.id,
    user_id: pledge.user_id,
    campaign_id: pledge.campaign_id,
    amount_cents: pledge.amount_cents,
  }
  end
end
