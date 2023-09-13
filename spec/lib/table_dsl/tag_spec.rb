# frozen_string_literal: true

RSpec.describe TableDsl::Tag do
  let(:tag) { described_class.new }

  describe '#set_attributes' do
    let(:result) { tag.set_attributes(**new_attributes) }
    let(:new_attributes) { { attr: 1, attr2: '2' } }

    it 'updates attributes' do
      expect { result }.to change { tag.instance_variable_get(:@attributes) }
        .from({}).to(new_attributes)
    end
  end

  describe '#set_styles' do
    let(:result) { tag.set_styles(**new_styles) }
    let(:new_styles) { { style: 1, style2: '2' } }

    it 'updates styles' do
      expect { result }.to change { tag.instance_variable_get(:@styles) }
        .from({}).to(new_styles)
    end
  end

  describe '#add_child' do
    let(:result) { tag.add_child(child) }
    let(:child) { '<p>Some Text</>' }

    it 'updates children collection' do
      expect { result }.to change { tag.instance_variable_get(:@children) }
        .from([]).to([child])
    end
  end

  describe '#to_s' do
    let(:result) { tag.to_s }

    it 'raises error' do
      expect { result }.to raise_error(NotImplementedError, 'Subclasses must implement the tag_name method')
    end
  end
end
