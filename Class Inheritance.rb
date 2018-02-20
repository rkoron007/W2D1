class Employee
  attr_accessor :name, :salary
  def initialize(name,title,salary,boss)
    @name,@title,@salary, @boss = name,title,salary, boss
  end

    def bonus(multiplier)
      bonus = (@salary) * multiplier
    end
end

class Manager < Employee
  def initialize(name,title,salary,boss,employees_under=[])
    super(name,title,salary,boss)
    @employees_under = employees_under
  end

  def bonus(multiplier)
    salaries = @employees_under.reduce(0) do |accu, cur|
      accu + cur.salary
    end
    salaries* multiplier
  end

end

Shawna = Employee.new("shawna","TA",12000, "Darren")
David = Employee.new("David","TA",10000, "Darren")

Darren = Manager.new("darren","TA Manager",78000, "Ned",[Shawna, David])

Ned = Manager.new("ned","Founder",1000000, nil, [Darren, Shawna, David])
