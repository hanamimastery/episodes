# frozen_string_literal: true

Main::Slice.register_provider :mailer, namespace: true do
  prepare do
    require "hanami/mailer"

    configuration = Hanami::Mailer::Configuration.new do |config|
      config.root = target.root.join("mailers")
      config.default_charset = "UTF-8"
      config.delivery_method = :smtp, {port: 1025, address: 'localhost'}
    end

    register "configuration", configuration
  end

  start do
    configuration = target['mailer.configuration']
    # Hanami::Mailer requires to initialize all mailers before finalizing
    # config, and finalizing config before using them.
    #
    mailers = Dir[configuration.root.join('*.rb')]
    mailers.each do |path|
      mailer_name = File.basename(path, '.*')
      target["mailers.#{mailer_name}"]
    end

    Hanami::Mailer.finalize(configuration)
  end
end
