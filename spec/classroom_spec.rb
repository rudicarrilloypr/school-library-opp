# spec/classroom_spec.rb
require_relative '../classroom'
require_relative '../student'

RSpec.describe Classroom do
  describe Classroom do
    let(:classroom) { Classroom.new('10A') }

    describe '#initialize' do
      it 'creates a classroom with a label' do
        expect(classroom.label).to eq('10A')
      end

      it 'initializes students as an empty array' do
        expect(classroom.students).to be_empty
      end
    end

    describe '#add_student' do
      it 'adds a student to the classroom' do
        student = Student.new(16, 'John Doe')
        classroom.add_student(student)

        expect(classroom.students).to include(student)
        expect(student.classroom).to eq(classroom)
      end
    end

    describe '#to_h' do
      it 'returns a hash representation of the classroom' do
        student = Student.new(16, 'John Doe')
        classroom.add_student(student)

        expected_hash = {
          label: '10A',
          student_ids: [student.id]
        }
        expect(classroom.to_h).to eq(expected_hash)
      end
    end
  end
end
