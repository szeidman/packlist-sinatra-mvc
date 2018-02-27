require 'spec_helper'

describe "Pannier" do
  before do
    @pannier = Pannier.create(name: "Ortlieb", location: "Front Left")

    @candy = Item.create(name: "Candy", weight: "0.5")
    @tire = Item.create(name: "Tire", weight: "1.5")

  end

  it "has a name" do
    expect(@pannier.name).to eq("Ortlieb")
  end

  it "has a location" do
    expect(@pannier.location).to eq("Front Left")
  end

  it "has many items" do
    @pannier.items << @candy
    @pannier.items << @tire
    expect(@pannier.items).to include(@candy)
    expect(@pannier.items).to include(@tire)
  end

end
