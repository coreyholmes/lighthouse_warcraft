class Barracks < Unit
  attr_reader :gold, :food, :lumber
  

  # Initialize Setup
  #-------------------------------
  def initialize
    super(500, 0)
    @gold = 1000
    @food = 80
    @lumber = 500
  end

  # ==================================================
  # Siege_engine
  # ==================================================

  # Cost
  #-------------------------------
  def siege_engine_cost
    @gold -= 200
    @food -= 3
    @lumber -= 60
  end

  # Train
  #-------------------------------
  def train_siege_engine
    if can_train_siege_engine?
      siege_engine_cost
      Siege_engine.new
    else
      nil
    end
  end

  # Resources available?
  #-------------------------------
  def can_train_siege_engine?
    if gold >= 200 && food >= 3 && lumber >= 60
      true
    else
      false
    end
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
