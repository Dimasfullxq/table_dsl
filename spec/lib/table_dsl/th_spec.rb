# frozen_string_literal: true

RSpec.describe TableDsl::Th do
  let(:th) { described_class.new }

  describe '#to_s' do
    shared_examples 'result' do
      it 'returns expected result' do
        expect(result).to eq(expected_result)
      end
    end

    let(:result) { th.to_s }

    context 'without any attributes, styles and children' do
      let(:expected_result) { "<th  >\n\n</th>" }

      include_examples 'result'
    end

    context 'with attributes, styles and children' do
      let(:attributes) { "class='th-class' id='another-th-id'" }
      let(:expected_result) do
        "<th #{attributes} style='background-color: red; color: blue;'>\n<p></p>\n</th>"
      end

      before do
        th.set_styles('background-color': 'red')
        th.set_attributes(class: 'th-class', id: 'th-id')
        th.set_attributes(id: 'another-th-id')
        th.set_styles(color: 'blue')
        th.add_child('<p></p>')
      end

      include_examples 'result'
    end
  end
end
