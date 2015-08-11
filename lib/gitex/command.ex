defmodule Gitex.Command do
  defmacro run(cmd) do
    quote do
      unquote(cmd)
    end
  end
end
