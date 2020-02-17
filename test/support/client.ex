defmodule Acl.Test.Support.Client do
  @moduledoc false

  def setup_user_has_permission do
    Tesla.Mock.mock(fn
      %{method: :get, url: @base_url <> "/validate"} ->
        {:ok, %Tesla.Env{data: %{"permission" => true}}}
    end)
  end

  def setup_user_has_no_permission do
    Tesla.Mock.mock(fn
      %{method: :get, url: @base_url <> "/validate"} ->
        {:ok, %Tesla.Env{data: %{"permission" => false}}}
    end)
  end
end
