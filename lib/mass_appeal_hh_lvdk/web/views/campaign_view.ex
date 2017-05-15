defmodule MassAppealHhLvdk.Web.CampaignView do
  use MassAppealHhLvdk.Web, :view

  alias MassAppealHhLvdk.Web.CampaignView

  def render("index.json", %{campaigns: campaigns}) do
    %{data: render_many(campaigns, CampaignView, "campaign.json")}
  end

  def render("show.json", %{campaign: campaign}) do
  %{
    data: %{
      id: campaign.id,
      user_id: campaign.user_id,
      name: campaign.name,
      description: campaign.description,
      total_funding_needed: campaign.total_funding_needed,
      canceled_at: Timex.format!(campaign.canceled_at, "%FT%T%:z", :strftime),
      completed_at: Timex.format!(campaign.completed_at, "%FT%T%:z", :strftime),
      due_at: Timex.format!(campaign.due_at, "%FT%T%:z", :strftime),
    }
  }
  end
end
