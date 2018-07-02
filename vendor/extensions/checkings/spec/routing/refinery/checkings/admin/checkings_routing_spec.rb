require "spec_helper"

describe "checkings admin routing", type: :routing do

  routes { Refinery::Core::Engine.routes }

  it "can route to new" do
    expect( :get => "/refinery/checkings/new" ).to route_to(
      :controller => "refinery/checkings/admin/checkings",
      :action => "new",
      :locale => :en
    )

  end

  it "can route to create" do
    expect( :post => "/refinery/checkings" ).to be_routable
  end

  it "can route to show" do
    expect( :get => "/refinery/checkings/1" ).to route_to(
      :controller => "refinery/checkings/admin/checkings",
      :action => "show",
      :id => '1',
      :locale => :en
    )
  end

  it "can route to edit" do
    expect( :get => "/refinery/checkings/1/edit" ).to route_to(
      :controller => "refinery/checkings/admin/checkings",
      :action => "edit",
      :id => "1",
      :locale => :en
    )
  end

  it "does not route to update" do
    expect( :update => "/refinery/checkings/1" ).not_to be_routable
  end

  it "does route to delete" do
    expect( :delete => "/refinery/checkings/1" ).to route_to(
      :controller => "refinery/checkings/admin/checkings",
      :action => "destroy",
      :id => '1',
      :locale => :en
    )
  end

end
