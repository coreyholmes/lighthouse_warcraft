class Barracks
  attr_reader :gold, :food

  # Initialize Setup
  #-------------------------------
  def initialize
    @gold = 1000
    @food = 80
  end

  # ==================================================
  # Footman
  # ==================================================

  # Cost
  #-------------------------------
  def footman_cost
    @gold -= 135
    @food -= 2
  end

  # Train
  #-------------------------------
  def train_footman
    if can_train_footman?
      footman_cost
      Footman.new
    else
      nil
    end
  end

  # Resources available?
  #-------------------------------
  def can_train_footman?
    if gold >= 135 && food >= 2
      true
    else
      false
    end
  end

  # ==================================================
  # Peasant
  # ==================================================

  # Cost
  #-------------------------------
  def peasant_cost
    @gold -= 90
    @food -= 5
  end

  # Train
  #-------------------------------
  def train_peasant
    if can_train_peasant?
      peasant_cost
      Peasant.new
    else
      nil
    end
  end

  # Resources available?
  #-------------------------------
  def can_train_peasant?
    if gold >= 90 && food >= 5
      true
    else
      false
    end
  end



end
