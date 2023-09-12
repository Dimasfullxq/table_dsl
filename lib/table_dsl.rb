# frozen_string_literal: true

require_relative 'table_dsl/tag'
require_relative 'table_dsl/th'
require_relative 'table_dsl/td'
require_relative 'table_dsl/tr'
require_relative 'table_dsl/table'

module TableDsl
  module Builder
    def table(&)
      table = Table.new
      table.add_child(table.instance_eval(&)) if block_given?
      update_result(table.to_s)
    end

    def tr(&)
      tr = Tr.new
      tr.add_child(tr.instance_eval(&)) if block_given?
      update_result(tr.to_s)
    end

    def th(&)
      th = Th.new
      th.add_child(th.instance_eval(&)) if block_given?
      update_result(th.to_s)
    end

    def td(&)
      td = Td.new
      td.add_child(td.instance_eval(&)) if block_given?
      update_result(td.to_s)
    end

    def raw_string
      update_result(yield) if block_given?
    end

    def update_result(new_result)
      @result ||= []
      @result << new_result
      @result.join("\n")
    end
  end
end
