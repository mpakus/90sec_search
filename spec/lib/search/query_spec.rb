# frozen_string_literal: true

RSpec.describe Search::Query do
  let(:output) { FakeSearchOutput.new }

  let(:users) { Oj.load(File.read('./spec/fixtures/db/users.json')) }
  let(:user) { Search::Query.new(users, output) }

  let(:projects) { Oj.load(File.read('./spec/fixtures/db/projects.json')) }
  let(:project) { Search::Query.new(projects, output) }

  describe '#find' do
    context 'with users' do
      it 'is find by boolean value' do
        user.find(true)
        expect(output.items).to include users[0]
        expect(output.items).to include users[1]
      end

      it 'is find by id value' do
        user.find(2)
        expect(output.items).to include users[1]
      end

      it 'is find by string value' do
        user.find('lank')
        user.find('mItc')
        expect(output.items).to include users[0]
        expect(output.items).to include users[1]
      end

      it 'is find in array value' do
        user.find('uTTo')
        expect(output.items).to include users[0]
      end

      it 'is find in hash value' do
        user.find('ELBournE')
        expect(output.items).to include users[1]
      end
    end

    context 'with projects' do
      it 'is find by id value' do
        project.find(101)
        expect(output.items).to include projects[0]
      end

      it 'is find by string value' do
        project.find('pRoF')
        expect(output.items).to include projects[1]
      end

      it 'is find in array value' do
        project.find('Singa')
        expect(output.items).to include projects[1]
      end
    end
  end
end
