# frozen_string_literal: true

module Main
  module Views
    module Scopes
      module Forms
        class Input < Main::Views::Scope
          def field_name
           super.to_s
          end

          def label_text
            return label if respond_to?(:label) && label

            _context.inflector.humanize(field_name)
          end

          def error_field?
            errors.any?
          end

          def control_class_names
            classes = %w[control]
            classes << 'has-icons-left' if has_icon?
            classes << 'has-icons-right is-danger' if error_field?

            classes.join(' ')
          end

          def has_icon?
            return false unless respond_to?(:icon_name)

            !icon_name.nil?
          end

          def errors
           super.to_a
          end

          def input_field_classes
           classes = %w[input]
           classes << 'is-danger' if error_field?
           classes.join(' ')
          end

          def placeholder_text
            return placeholder if respond_to?(:placeholder) && placeholder

            _context.inflector.humanize(field_name)
          end
        end
      end
    end
  end
end
