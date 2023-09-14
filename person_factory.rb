class PersonFactory
  def self.create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp.to_i

    print 'Age: '
    age = gets.chomp

    unless age.to_i.to_s == age
      puts 'Input is not a valid number'
      return nil
    end

    age = age.to_i

    print 'Name: '
    name = gets.chomp

    if choice == 1
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'

      classroom = Classroom.new('10th Grade') # for simplicity, assume all students are in 10th Grade
      Student.new(age, classroom, name, parent_permission: parent_permission)
    elsif choice == 2
      print 'Specialization: '
      specialization = gets.chomp

      Teacher.new(age, specialization, name)
    else
      puts 'Invalid option'
      nil
    end
  end
end
