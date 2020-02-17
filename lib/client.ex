defmodule Acl.Client do
  @moduledoc """
  Access control list client.
  """
  import Tesla, only: [get: 3]

  alias Tesla.Middleware.{
    BaseUrl,
    JSON
  }

  alias Acl.Schema.Validate
  alias Acl.Response

  @acl_host Application.get_env(:acl, :host)[:name]

  @doc """
  Acl client
  """
  def get do
    middleware = [
      {BaseUrl, @acl_host},
      JSON
    ]

    Tesla.client(middleware)
  end

  def validate(client \\ get(), %Ecto.Changeset{} = data) do
    with data.valid? do
      response = client
      |> get("/validate", query: Validate.to_map(data))

      case response do
        {:ok, _} = data -> Response.parse(data)
      end
    end
  end
end
