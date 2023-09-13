# frozen_string_literal: true

RSpec.describe TableDsl do
  it 'has a version number' do
    expect(TableDsl::VERSION).not_to be_nil
  end

  describe 'Builder' do
    shared_examples 'result' do
      it 'returns expected result' do
        expect(result).to eq(expected_result)
      end
    end

    let(:dummy_object) { Class.new { include TableDsl::Builder }.new }

    describe '#table' do
      context 'without block' do
        let(:result) { dummy_object.table }
        let(:expected_result) { "<table  >\n\n</table>" }

        include_examples 'result'
      end

      context 'with empty block' do
        let(:result) { dummy_object.table {} }
        let(:expected_result) { "<table  >\n\n</table>" }

        include_examples 'result'
      end

      context 'with filled block' do
        let(:result) { dummy_object.table { '<tr></tr>' } }
        let(:expected_result) { "<table  >\n<tr></tr>\n</table>" }

        include_examples 'result'
      end
    end

    describe '#tr' do
      context 'without block' do
        let(:result) { dummy_object.tr }
        let(:expected_result) { "<tr  >\n\n</tr>" }

        include_examples 'result'
      end

      context 'with empty block' do
        let(:result) { dummy_object.tr {} }
        let(:expected_result) { "<tr  >\n\n</tr>" }

        include_examples 'result'
      end

      context 'with filled block' do
        let(:result) { dummy_object.tr { '<th></th>' } }
        let(:expected_result) { "<tr  >\n<th></th>\n</tr>" }

        include_examples 'result'
      end
    end

    describe '#th' do
      context 'without block' do
        let(:result) { dummy_object.th }
        let(:expected_result) { "<th  >\n\n</th>" }

        include_examples 'result'
      end

      context 'with empty block' do
        let(:result) { dummy_object.th {} }
        let(:expected_result) { "<th  >\n\n</th>" }

        include_examples 'result'
      end

      context 'with filled block' do
        let(:result) { dummy_object.th { '<p></p>' } }
        let(:expected_result) { "<th  >\n<p></p>\n</th>" }

        include_examples 'result'
      end
    end

    describe '#td' do
      context 'without block' do
        let(:result) { dummy_object.td }
        let(:expected_result) { "<td  >\n\n</td>" }

        include_examples 'result'
      end

      context 'with empty block' do
        let(:result) { dummy_object.td {} }
        let(:expected_result) { "<td  >\n\n</td>" }

        include_examples 'result'
      end

      context 'with filled block' do
        let(:result) { dummy_object.td { '<p></p>' } }
        let(:expected_result) { "<td  >\n<p></p>\n</td>" }

        include_examples 'result'
      end
    end

    describe '#raw_string' do
      context 'without block' do
        let(:result) { dummy_object.raw_string }
        let(:expected_result) { nil }

        include_examples 'result'
      end

      context 'with empty block' do
        let(:result) { dummy_object.raw_string {} }
        let(:expected_result) { '' }

        include_examples 'result'
      end

      context 'with filled block' do
        let(:result) { dummy_object.raw_string { '<p>Hello</p>' } }
        let(:expected_result) { '<p>Hello</p>' }

        include_examples 'result'
      end
    end
  end
end
