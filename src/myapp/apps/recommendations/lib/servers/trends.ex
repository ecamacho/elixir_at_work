defmodule Recommendations.Trends do  
  use GenServer
  require Logger
  
  def start_link do   
    :gen_server.start_link({ :local, :trends}, __MODULE__, [], [])
  end

  def init(_) do
    {:ok, {}}
  end

end