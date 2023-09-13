# frozen_string_literal: true

RSpec.describe TableDsl::Tr do
  let(:tr) { described_class.new }

  describe '#to_s' do
    shared_examples 'result' do
      it 'returns expected result' do
        expect(result).to eq(expected_result)
      end
    end

    let(:result) { tr.to_s }

    context 'without any attributes, styles and children' do
      let(:expected_result) { "<tr  >\n\n</tr>" }

      include_examples 'result'
    end

    context 'with attributes, styles and children' do
      let(:attributes) { "class='tr-class' id='another-tr-id'" }
      let(:expected_result) do
        "<tr #{attributes} style='background-color: red; color: blue;'>\n<th></th>\n</tr>"
      end

      before do
        tr.set_styles('background-color': 'red')
        tr.set_attributes(class: 'tr-class', id: 'tr-id')
        tr.set_attributes(id: 'another-tr-id')
        tr.set_styles(color: 'blue')
        tr.add_child('<th></th>')
      end

      include_examples 'result'
    end
  end
end
