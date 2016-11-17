defmodule Recommendations do
  use Application
  
  @pool_name :rabbitmq_listeners
  
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    poolboy_config = [
      {:name, {:local, @pool_name}},
      {:worker_module, Recommendations.Listener},
      {:size, 10},
      {:max_overflow, 1}
    ]

    children = [      
      worker(Recommendations.Trends, []),
      worker(Recommendations.RecommendersSupervisor,[]),
      :poolboy.child_spec(@pool_name, poolboy_config, []),

    ]
    
    opts = [strategy: :one_for_one, name: Recommendations.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
