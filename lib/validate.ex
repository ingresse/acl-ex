defmodule Acl.Validate do
  @moduledoc """
  Access control list validate permission module
  """
  import Tesla, only: [get: 3]

  alias Acl.Schema.Validate

  def validate(client, %Ecto.Changeset{} = data) do
    with data.valid? do
      response = client
      |> get("/validate", query: Validate.to_map(data))

      case response do
        {:ok, %Tesla.Env{body: %{"data" => data}}} ->
          {:ok, data}
      end
    end
  end
end
