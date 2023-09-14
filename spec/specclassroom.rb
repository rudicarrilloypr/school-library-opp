# spec/classroom_spec.rb
require_relative '../classroom'

RSpec.describe Classroom do
  let(:classroom) { Classroom.new('Class A') }

  it 'returns the label of the classroom' do
    expect(classroom.label).to eq('Class A')
  end

  it 'returns an empty array by default' do
    expect(classroom.students).to be_an(Array).and be_empty
  end

  it 'adds a student to the classroom' do
    student = double('Student', classroom: nil)
    classroom.add_student(student)
    expect(classroom.students).to include(student)
    expect(student).to have_received(:classroom=).with(classroom)
  end

  # Example:
  it 'adds multiple students to the classroom' do
    student1 = double('Student', classroom: nil)
    student2 = double('Student', classroom: nil)
    classroom.add_student(student1)
    classroom.add_student(student2)
    expect(classroom.students).to include(student1, student2)
    expect(student1).to have_received(:classroom=).with(classroom)
    expect(student2).to have_received(:classroom=).with(classroom)
  end
end
