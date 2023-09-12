# frozen_string_literal: true

module TableDsl
  class Tag
    def initialize
      @attributes = {}
      @children = []
      @styles = {}
    end

    def set_attributes(**new_attributes)
      @attributes.merge!(**new_attributes)
    end

    def add_child(child)
      (@children << child).flatten!
    end

    def set_styles(**new_styles)
      @styles.merge!(**new_styles)
    end

    def to_s
      attributes_str = attributes.map { |key, value| "#{key}='#{value}'" }.join(' ')
      style_attributes = styles.map { |key, value| "#{key}: #{value};" }.join(' ')

      style_str = "style='#{style_attributes}'" unless style_attributes.empty?

      children_str = children.map(&:to_s).join("\n")

      "<#{tag_name} #{attributes_str} #{style_str}>\n#{children_str}\n</#{tag_name}>"
    end

    private

    attr_reader :attributes, :styles, :children

    def tag_name
      raise NotImplementedError, 'Subclasses must implement the tag_name method'
    end
  end
end
