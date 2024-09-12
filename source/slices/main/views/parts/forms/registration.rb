# frozen_string_literal: true

module Main
  module Views
    module Parts
      module Forms
        class Registration < Part
          SCOPE_CLASS = Scopes::Forms::Input

          def username_input(f)
            prepare_scope(f, :username, icon_name: 'user')
              .render('shared/forms/text_field')
          end

          def password_input(f)
            prepare_scope(f, :password, icon_name: 'lock')
              .render('shared/forms/password_field')
          end

          def password_confirmation_input(f)
            prepare_scope(f, :password_confirmation, icon_name: 'lock')
              .render('shared/forms/password_field')
          end

          def tac_input(f)
            tac_link = helpers.link_to "terms and conditions", "#"
            pp_link = helpers.link_to "privacy policy", "#"
            label_text = "I agree to #{ tac_link } & #{ pp_link }".html_safe
            prepare_scope(f, :tac, label: label_text)
              .render('shared/forms/check_box_field')
          end

          private

          def prepare_scope(f, field_name, **options)
            scope(
              SCOPE_CLASS,
              f: f,
              field_name: field_name,
              errors: errors(field_name),
              **options
            )
          end

          def errors(key)
            value.dig(:errors, key).to_a
          end
        end
      end
    end
  end
end
