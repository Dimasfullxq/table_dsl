# frozen_string_literal: true

require_relative 'lib/table_dsl'

include TableDsl::Builder

html = table do
  raw_string { '<p>Table here</p>' }
  set_styles('background-color': 'lightgray')

  tr do
    set_styles('background-color': 'lightblue')
    th { 'Header 1' }
    th { 'Header 2' }
    th do
      set_attributes(colspan: 2)
      'Header 3'
    end
  end
  set_styles(width: '100%')

  tr do
    td do
      raw_string { '<p>Data 0</p>' }
    end
    td { 'Data 1' }
    td { 'Data 2' }
    td { 'Data 3' }
  end

  tr do
    td { 'Data 4' }
    td { 'Data 5' }
    td { 'Data 6' }
  end

  tr do
    td { nil }
    td { nil }
    td { nil }
    td { 'Data 7' }
  end
end

File.write('output.html', html.strip)
