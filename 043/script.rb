

require 'front_matter_parser'

file_contents = File.read('./sample.md')
parsed = FrontMatterParser::Parser.new(:md).call(file_contents)

pp parsed.front_matter['title']
pp parsed.front_matter['title']
pp '----'
pp parsed.front_matter
pp parsed.content


parsed = FrontMatterParser::Parser.parse_file('sample.md')

parsed = FrontMatterParser::Parser.parse_file('sample.haml')
pp parsed.to_h



require 'yaml'
loader = -> (string)  YAML.load(string) }
FrontMatterParser::Parser.parse_file('sample.md', loader: loader)
