require "spec_helper"

describe "Checkings front-end routing", type: :routing do

  routes { Refinery::Core::Engine.routes }

  it "can route to index" do
    expect( :get => "/checkings" ).to route_to(
      :controller => "refinery/checkings/checkings",
      :action => "index",
      :locale => :en
    )
  end

  it "can route to new" do
    expect( :get => "/checkings/new" ).to route_to(
      :controller => "refinery/checkings/checkings",
      :action => "new",
      :locale => :en
    )
  end

  it "can route to create" do
    expect( :post => "/checkings" ).to route_to(
      :controller => "refinery/checkings/checkings",
      :action => "create",
      :locale => :en
    )
  end

  it "routes to thank_you" do
    expect( :get => "/checkings/thank_you" ).to route_to(
      :controller => "refinery/checkings/checkings",
      :action => "thank_you",
      :locale => :en
    )
  end

  it "does not route to show" do
    expect( :get => "/checkings/1" ).not_to route_to(
      :controller => "refinery/checkings/checkings",
      :action => "show",
      :locale => :en
    )
  end

  it "does not route to edit" do
    expect( :get => "/checkings/1/edit" ).not_to route_to(
      :controller => "refinery/checkings/checkings",
      :action => "edit",
      :locale => :en
    )
  end

  it "does not route to update" do
    expect( :update => "/checkings/1" ).not_to be_routable
  end

  it "does not route to delete" do
    expect( :delete => "/checkings/1" ).not_to be_routable
  end

end
