defmodule CoverageReporterTest.Repo do
  use Ecto.Repo,
    otp_app: :coverage_reporter_test,
    adapter: Ecto.Adapters.Postgres
end
