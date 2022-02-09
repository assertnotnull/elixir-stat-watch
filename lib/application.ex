defmodule StatWatch.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      %{id: StatWatch.Scheduler, start: {StatWatch.Scheduler,:start_link, []}}
    ]

    opts = [strategy: :one_for_one, name: StatWatch.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
