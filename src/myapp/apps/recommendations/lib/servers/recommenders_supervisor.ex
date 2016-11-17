defmodule Recommendations.RecommendersSupervisor do  
  use Supervisor

  @supervisor_name :recommenders_supervisor
  
  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: @supervisor_name)
  end

  def start_recommender do
    Supervisor.start_child(@supervisor_name, [])
  end

  def stop_recommender(pid) do
    Supervisor.terminate_child(@supervisor_name, pid)
  end

  def init(:ok) do
    children = [
      worker(Recommendations.Recommender, [], restart: :temporary)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end

end