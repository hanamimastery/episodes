# frozen_string_literal: true

Hanami.application.register_bootable :view do |container|
  start do
    register "view.context", Welcome::View::Context.new
  end
end
