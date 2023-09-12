# TableDsl
DSL for fast building simple html tables

## Install gem
```
gem install table_dsl
```

## Use gem
```
require 'table_dsl'
```

## Example

## Include Builder
```ruby
include TableDsl::Builder
```
## Usage
```ruby
table do # main block, builds <table> </table>
  raw_string { '<p>Table here</p>' } # use to add text or other tags
  set_styles('background-color': 'lightgray') # set styles

  tr do # table row <tr> </tr>
    set_styles("background-color": "lightblue")
    th do # table head <th> </th>
      'Header 1'
    end
    th { 'Header 2' }
    th do
      set_attributes(colspan: 2) # set attributes (will assign attributes for tag in which block is added)
      'Header 3'
    end
  end

  set_styles(width: '100%') # assign additional styles/attributes

  tr do
    td do
      raw_string {'<p>Data 0</p>' }
    end
    td { "Data 1" }
    td { "Data 2" }
    td { "Data 3" }
  end

  tr do
    td { "Data 4" }
    td { "Data 5" }
    td { "Data 6" }
  end

  tr do
    td {  }
    td {  }
    td {  }
    td { 'Data 7' }
  end
end
```
## Output

```html
<table style='background-color: lightgray; width: 100%;'>
    <p>Table here</p>

    <tr style='background-color: lightblue;'>
        <th>
            Header 1
        </th>
        <th>
            Header 2
        </th>
        <th colspan='2' >
            Header 3
        </th>
    </tr>

    <tr>
        <td>
            <p>Data 0</p>
        </td>
        <td>
            Data 1
        </td>
        <td>
            Data 2
        </td>
        <td>
            Data 3
        </td>
    </tr>

    <tr>
        <td>
            Data 4
        </td>
        <td>
            Data 5
        </td>
        <td>
            Data 6
        </td>
    </tr>

    <tr>
        <td>
        </td>
        <td>
        </td>
        <td>
        </td>
        <td>
            Data 7
        </td>
    </tr>
</table>
```
## You can play with options by modifying ```script.rb``` and running ``` ruby script.rb ``` in your console.

