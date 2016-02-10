class Unit
  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  # ==================================================
  # Unit
  # ==================================================


  # Attack
  #-------------------------------
  def attack!(unit_to_attack)
    if self.dead?
      puts "You are dead."
    elsif unit_to_attack.dead?
      puts "Enemy is dead."
    else
      # SiegeEngine > Barracks = x2 Damage
      if unit_to_attack.is_a?(Barracks) && self.is_a?(SiegeEngine)
        unit_to_attack.damage((@attack_power * 2).ceil)
      
      # Footman > Barracks = 1/2 Damage
      elsif unit_to_attack.is_a?(Barracks) && self.is_a?(Footman)
        unit_to_attack.damage((@attack_power / 2).ceil)
      
      # SiegeEngine > Footman = 0 Damage
      elsif unit_to_attack.is_a?(Footman) && self.is_a?(SiegeEngine)
        unit_to_attack.damage((@attack_power = 0).ceil)
      else
        unit_to_attack.damage(@attack_power)
      end
    end
  end

  # Damage
  #-------------------------------
  def damage(power)
    @health_points -= power
  end

  # Death
  #-------------------------------  
  def dead?
    if health_points <= 0
      true
    end
  end
end