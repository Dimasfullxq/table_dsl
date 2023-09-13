# frozen_string_literal: true

RSpec.describe TableDsl::Td do
  let(:td) { described_class.new }

  describe '#to_s' do
    shared_examples 'result' do
      it 'returns expected result' do
        expect(result).to eq(expected_result)
      end
    end

    let(:result) { td.to_s }

    context 'without any attributes, styles and children' do
      let(:expected_result) { "<td  >\n\n</td>" }

      include_examples 'result'
    end

    context 'with attributes, styles and children' do
      let(:attributes) { "class='td-class' id='another-td-id'" }
      let(:expected_result) do
        "<td #{attributes} style='background-color: red; color: blue;'>\n<p></p>\n</td>"
      end

      before do
        td.set_styles('background-color': 'red')
        td.set_attributes(class: 'td-class', id: 'td-id')
        td.set_attributes(id: 'another-td-id')
        td.set_styles(color: 'blue')
        td.add_child('<p></p>')
      end

      include_examples 'result'
    end
  end
end
