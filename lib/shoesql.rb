Shoes.setup do
  gem 'anbt-sql-formatter', '~> 0.1.0'
end
require "anbt-sql-formatter/formatter"

Shoes.app do
  background "#282828"
  flow do
    image 'logo.jpg'
    @edit_box = edit_box('Insert SQL', width: 596, height: 200)
  end
  flow do
    button('Format') do
      rule = AnbtSql::Rule.new
      rule.keyword = AnbtSql::Rule::KEYWORD_UPPER_CASE
      # User defined additional functions:
      %w(count sum substr date).each{|func_name|
        rule.function_names << func_name.upcase
      }
      rule.indent_string = "    "
      formatter = AnbtSql::Formatter.new(rule)
      result = formatter.format(@edit_box.text)
      @output.text = result
    end
  end
  flow do
    @output = edit_box('', width: 596, height: 200)
  end
end
