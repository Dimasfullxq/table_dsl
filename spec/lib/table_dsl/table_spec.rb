# frozen_string_literal: true

RSpec.describe TableDsl::Table do
  let(:table) { described_class.new }

  describe '#to_s' do
    shared_examples 'result' do
      it 'returns expected result' do
        expect(result).to eq(expected_result)
      end
    end

    let(:result) { table.to_s }

    context 'without any attributes, styles and children' do
      let(:expected_result) { "<table  >\n\n</table>" }

      include_examples 'result'
    end

    context 'with attributes, styles and children' do
      let(:attributes) { "class='table-class' id='another-table-id'" }
      let(:expected_result) do
        "<table #{attributes} style='background-color: red; color: blue;'>\n<tr></tr>\n</table>"
      end

      before do
        table.set_styles('background-color': 'red')
        table.set_attributes(class: 'table-class', id: 'table-id')
        table.set_attributes(id: 'another-table-id')
        table.set_styles(color: 'blue')
        table.add_child('<tr></tr>')
      end

      include_examples 'result'
    end
  end
end
