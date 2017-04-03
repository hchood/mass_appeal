defmodule MassAppealHhLvdk.Web.CampaignView do
  use MassAppealHhLvdk.Web, :view

  def render("index.json", %{campaigns: campaigns}) do
    %{
      campaigns: Enum.map(campaigns, &campaign_json/1)
    }
  end

  # TODO return only certain attributes
  def campaign_json(campaign) do
    campaign
  end
end
