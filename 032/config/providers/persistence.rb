# frozen_string_literal: true

Hanami.app.register_provider :persistence, namespace: true do
  prepare do
    require 'rom-changeset'
    require 'rom/core'
    require 'rom/sql'

    config =
      ROM::Configuration.new(
        :sql,
        target['settings'].database_url,
        extensions: %i[pg_array pg_json]
      )

    config.plugin(:sql, relations: :pagination)

    register 'config', config
    register 'db', config.gateways[:default].connection
  end

  start do
    config = target['persistence.config']
    config.auto_registration(
      target.root.join('lib/sandbox/persistence'),
      namespace: 'Sandbox::Persistence'
    )

    register 'rom', ROM.container(config)
  end
end
