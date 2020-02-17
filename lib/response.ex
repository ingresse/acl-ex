defmodule Acl.Response do
  @moduledoc false

  defstruct [:permission]

  def parse({:ok, %Tesla.Env{body: %{"data" => data}}}), do: parse({:ok, data})
  def parse({:ok, %{"permission" => has_permission?}}) do
    data = %__MODULE__{permission: has_permission?}
    {:ok, data}
  end
end
