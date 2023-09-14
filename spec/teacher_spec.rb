require_relative '../teacher'

RSpec.describe Teacher do
  describe '#initialize' do
    it 'creates a new teacher object with provided attributes' do
      teacher = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Mathematics')

      expect(teacher).to be_a(Teacher)
      expect(teacher.name).to eq('Mr. Smith')
      expect(teacher.age).to eq(35)
      expect(teacher.instance_variable_get(:@specialization)).to eq('Mathematics')
    end
  end

  describe '#can_use_services?' do
    teacher = Teacher.new(name: 'Mrs. Johnson', age: 42, specialization: 'History')

    it 'returns true for teacher' do
      expect(teacher.can_use_services?).to eq(true)
    end

<<<<<<< HEAD
    describe '#can_use_services?' do
      it 'returns true for teachers' do
        expect(teacher.can_use_services?).to be_truthy
      end
    end

    describe '#to_h' do
      it 'returns a hash representation of the teacher' do
        expected_hash = {
          id: teacher.id,
          name: 'Jane Doe',
          age: 30,
          parent_permission: true,
          specialization: 'Mathematics',
          rentals: []
        }
        expect(teacher.to_h).to eq(expected_hash)
      end
=======
    it 'Should check if the object is converted into hash' do
      expect(teacher.to_hash.class).to eq Hash
>>>>>>> a4b50254b8b8d4ffd0d641c2b524332f5386095b
    end
  end
end
