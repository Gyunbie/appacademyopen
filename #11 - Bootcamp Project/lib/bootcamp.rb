class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |h,k| h[k] = [] }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(str)
    @teachers << str
  end

  def enroll(str)
    if students.length < @student_capacity
      @students << str
      return true
    else
      return false
    end
  end

  def enrolled?(str)
    students.include?(str) ? true : false
  end

  def student_to_teacher_ratio
    students.length / teachers.length
  end

  def add_grade(student, num)
    if students.include?(student)
      @grades[student] << num
      return true
    else
      return false
    end
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    if @grades[student].length == 0 || @grades[student].nil?
      return nil
    else
      @grades[student].sum / @grades[student].length
    end
  end
end
