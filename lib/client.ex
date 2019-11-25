defmodule Acl.Client do
  @moduledoc """
  Access control list client.
  """
  alias Tesla.Middleware.{
    BaseUrl,
    JSON
  }

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
end
