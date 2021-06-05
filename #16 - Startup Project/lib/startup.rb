require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.include?(title)
  end

  def >(startup)
    self.funding > startup.funding
  end

  def hire(employee_name, title)
    unless valid_title?(title)
      raise ArgumentError
    else
      new_employee = Employee.new(employee_name, title)
      employees << new_employee
    end
  end

  def size
    @employees.size
  end

  def pay_employee(employee)
    if @funding > @salaries[employee.title]
      employee.pay(@salaries[employee.title])
      @funding -= @salaries[employee.title]
    else
      raise ArgumentError
    end
  end

  def payday
    @employees.each { |emp| pay_employee(emp) }
  end

  def average_salary
    sum = 0
    @employees.each { |employee| sum += @salaries[employee.title] }
    sum / size
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding
    @salaries = startup.salaries.merge(@salaries)
    startup.employees.each { |emp| @employees << emp }
    startup.close
  end
end
