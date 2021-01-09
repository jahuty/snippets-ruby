# frozen_string_literal: true

module Jahuty
  module Resource
    RSpec.describe Render do
      subject(:render) { described_class.new(content: 'foo') }

      let(:content) { 'foo' }

      describe '#initialize' do
        it 'sets content' do
          expect(render.content).to eq(content)
        end
      end

      describe '#to_s' do
        it 'returns content' do
          expect(render.to_s).to eq(content)
        end
      end

      describe 'serialization' do
        it 'does not raise error' do
          expect { Marshal.load(Marshal.dump(render)) }.not_to raise_error(::TypeError)
        end

        it 'has correct attributes' do
          expect(Marshal.load(Marshal.dump(render))).to have_attributes(content: 'foo')
        end
      end
    end
  end
end
