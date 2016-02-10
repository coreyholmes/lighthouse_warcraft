require_relative 'spec_helper'


# ==================================================
# Barracks
# ==================================================
describe Barracks do

  before :each do
    @barracks = Barracks.new
    @footman = Footman.new
  end

  it "Barracks has 500 hp" do
    expect(@barracks.health_points).to be(500)
  end

   it "Barracks takes half damage from Footmen (5)" do
    @footman.attack!(@barracks)
    expect(@barracks.health_points).to eq(495)
  end

  it "Barracks starts off with 500 lumber" do
    expect(@barracks.lumber).to eq(500)
  end
end

# ==================================================
# Footman
# ==================================================
describe Unit do

  before :each do 
    @unit = Unit.new(50, 10)
    @attacker = Unit.new(500, 100)
  end

  describe "#dead?" do
    it "When Unit dies a horrific death" do
      @attacker.attack!(@unit)      
      expect(@unit.dead?).to eq(true)
      @attacker.attack!(@unit)     
    end
  end
end

# ==================================================
# SiegeEngine
# ==================================================
describe SiegeEngine do

  before :each do
    @barracks = Barracks.new
    @siege_unit = SiegeEngine.new
    @footman = Footman.new
  end

  it "SiegeEngine does 2x damage to buildings (100)" do
    @siege_unit.attack!(@barracks) 
    expect(@barracks.health_points).to be(400)
  end

  it "SiegeEngine cannot attack Footman" do
    @siege_unit.attack!(@footman)
    expect(@footman.health_points).to be(60)
  end

end
