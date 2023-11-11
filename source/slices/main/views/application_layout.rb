# frozen_string_literal: true

module Main
  module Views
    class ApplicationLayout < View
      def template
        doctype
        html do
          head do
            link(rel: "stylesheet", href: "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css")
          end
          body do
            div(class: "container") do
              nav(class: "navbar", role: "navigation") do
                div(class: "navbar-menu") do
                  div(class: "navbar-start") do
                    a(href: "/root", class: 'navbar-item') { 'Home' }
                    a(href: "/contact", class: 'navbar-item') { 'Contact' }
                  end
                end
              end
              yield
            end
          end
        end
      end
    end
  end
end
