defmodule MassAppealHhLvdk.Web.CampaignView do
  use MassAppealHhLvdk.Web, :view

  alias MassAppealHhLvdk.Web.CampaignView

  def render("index.json", %{campaigns: campaigns}) do
    %{data: render_many(campaigns, CampaignView, "campaign.json")}
  end

  def render("show.json", %{campaign: campaign}) do
  %{id: campaign.id,
    name: campaign.name,
    description: campaign.description,
    total_funding_needed: campaign.total_funding_needed}
  end
end
