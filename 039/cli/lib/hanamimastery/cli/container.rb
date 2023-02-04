require 'zeitwerk'
require 'dry-system'

module Hanamimastery
  module CLI
    class Container < Dry::System::Container
      use :zeitwerk

      configure do |config|
        config.component_dirs.add "lib" do |dir|
          dir.namespaces.add "hanamimastery/cli", key: nil
        end
        config.inflector = Dry::Inflector.new do |inflections|
          inflections.acronym('CLI')
          inflections.acronym('PRO')
        end
      end
    end
  end
end
