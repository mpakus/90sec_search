# frozen_string_literal: true

RSpec.describe Search::DB do
  let(:db) { './spec/fixtures/db' }
  let(:wrong_db) { './spec/features/db/WRONG' }

  context 'with wrong db directory' do
    it 'is raise error when directory not exists' do
      expect { Search::DB.new(wrong_db) }.to raise_error Search::ErrorDirNotFound
    end
  end

  context 'with correct db directory' do
    subject { Search::DB.new(db) }

    describe '.new' do
      it 'is create object when directory exists' do
        expect(subject.class).to eq Search::DB
      end
    end

    describe '#each_table' do
      it { subject.each_table { |table| expect(table.class).to eq Array } }
    end
  end
end
