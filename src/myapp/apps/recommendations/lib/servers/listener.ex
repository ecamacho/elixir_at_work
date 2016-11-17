defmodule Recommendations.Listener do  
  use GenServer
  require Logger
  
  def start_link(opts) do   
    :gen_server.start_link(__MODULE__, [], opts)
  end

  def init(_opts) do
    {:ok, {}}
  end

end