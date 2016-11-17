defmodule Recommendations.Recommender do
  use GenServer
  require Logger
  
  def start_link do   
    :gen_server.start_link(__MODULE__, [], [])
  end

  def init(_) do
    {:ok, {}}
  end  

end