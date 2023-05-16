defmodule CoverageReporterTestWeb.PageController do
  use CoverageReporterTestWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
    |> tap(fn _ -> :noop end)
  end
end
