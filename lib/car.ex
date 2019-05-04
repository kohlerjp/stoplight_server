defmodule Car do
  use While

  def run() do
    while Stoplight.Server.check_light() != :green do
      IO.puts("WAIT")
    end
  end
end
