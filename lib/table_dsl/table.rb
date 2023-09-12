# frozen_string_literal: true

module TableDsl
  class Table < Tag
    private

    def tag_name
      :table
    end
  end
end
