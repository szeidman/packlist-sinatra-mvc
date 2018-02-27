require 'spec_helper'

describe "Item" do
  before do
    @pannier = Pannier.create(name: "Ortlieb", location: "Front Left")

    @candy = Item.create(name: "Candy", weight: "0.5")
    @tire = Item.create(name: "Tire", weight: "1.5")

  end

  it "has a name and weight" do
    expect(@candy.name).to eq("Candy")
    expect(@candy.weight). to eq(0.5)
  end

  it "belongs to a pannier" do
    @pannier.items << @candy
    expect(@candy.pannier).to eq(@pannier)
  end

end
