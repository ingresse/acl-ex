defmodule Acl.Test.ClientTest do
  @moduledoc false
  use ExUnit.Case

  import Tesla.Mock

  alias Acl.Test.Support.Client, as: ClientMock
  alias Acl.Schema.Validate, as: ValidateSchema
  alias Acl.{
    Client,
    Response
  }

  @base_url Application.get_env(:acl, :host)[:name]

  test "get client" do
    %Tesla.Client{pre: data} = Client.get()

    {_, _, [base_url]} =
      data
      |> Enum.at(0)

    assert base_url == @base_url
  end

  describe "validate" do
    test "user has no permission" do
      expected_response = {:ok, %Response{permission: false}}
      data = %{ingresse_id: 1000, permission: "view", resource: "transaction"}
      |> ValidateSchema.changeset()

      mock(fn
        %{method: :get, url: @base_url <> "validate", query: %{ingresse_id: 1000}} ->
         {:ok, %Tesla.Env{body: %{"data" => %{"permission" => false}}}}
      end)

      response = Client.validate(data)


      assert response == expected_response
    end

    test "user has permission" do
      expected_response = {:ok, %Response{permission: true}}
      data = %{ingresse_id: 1001, permission: "view", resource: "transaction"}
      |> ValidateSchema.changeset()

      mock(fn
        %{method: :get, url: @base_url <> "validate", query: %{ingresse_id: 1001}} ->
          {:ok, %Tesla.Env{body: %{"data" => %{"permission" => true}}}}
      end)

      response = Client.validate(data)

      assert response == expected_response
    end
  end
end
