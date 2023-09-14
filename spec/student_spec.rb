# spec/student_spec.rb
require_relative '../person'
require_relative '../student'
require_relative '../classroom'

RSpec.describe Student do
<<<<<<< HEAD
  describe Student do
    let(:classroom) { Classroom.new('10A') }
    let(:student) { Student.new(age: 16, classroom: classroom, name: 'John Doe') }

    describe '#initialize' do
      it 'creates a student with age, classroom, name, and default parent permission' do
        expect(student.age).to eq(16)
        expect(student.classroom).to eq(classroom)
        expect(student.name).to eq('John Doe')
        expect(student.instance_variable_get(:@parent_permission)).to be_truthy
      end

      it 'adds the student to the classroom if not already included' do
        expect(classroom.students).to include(student)
=======
  describe '#play_hooky' do
    context 'when the student is already playing' do
      it 'should return ¯(ツ)/¯' do
        student = Student.new(name: 'Alice', age: 20)
        expect(student.play_hooky).to eq('¯(ツ)/¯')
>>>>>>> a4b50254b8b8d4ffd0d641c2b524332f5386095b
      end
    end
  end

  describe '#add_classroom' do
    student = Student.new(name: 'Alice', age: 20)
    classroom = Classroom.new('Math')

    it 'adds the student to the classroom if not already present' do
      student.add_classroom(classroom)

      expect(student.classroom.label).to eq(classroom.label)
      expect(classroom.students).to include(student)
    end

<<<<<<< HEAD
    describe '#to_h' do
      it 'returns a hash representation of the student' do
        expected_hash = {
          id: student.id,
          name: 'John Doe',
          age: 16,
          parent_permission: true,
          classroom: '10A',
          rentals: []
        }
        expect(student.to_h).to eq(expected_hash)
=======
    it 'does not add the student again if already in the classroom' do
      student.add_classroom(classroom)
      initial_students = classroom.students.dup

      student.add_classroom(classroom)

      expect(student.classroom.label).to eq(classroom.label)
      expect(classroom.students).to eq(initial_students)
    end

    context 'Change the data to HASH format:' do
      it 'Check if the array is converted into hash' do
        expect(student.to_hash.class).to eq Hash
>>>>>>> a4b50254b8b8d4ffd0d641c2b524332f5386095b
      end
    end
  end
end
