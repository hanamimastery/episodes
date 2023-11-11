# slices/main/views/parts/errors.rb

module Main
  module Views
    module Parts
      class Errors < Part
        def message(key)
          msgs = value[key] || []
          msg = msgs.join(", ")
          return msg if msg.empty?

          render :form_error, message: msg
        end
      end
    end
  end
end
