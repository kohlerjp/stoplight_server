defmodule While do
  defmacro __using__(options) do
    quote do
      defmacro while(predicate, do: expression) do
        quote do
          while_function = fn(recursive) ->
            if unquote(predicate) do
              unquote(expression)
              recursive.(recursive)
            end
          end
          while_function.(while_function)
        end
      end
    end
  end
end
