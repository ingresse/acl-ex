defmodule Acl.Schema.Validate do
    use Ecto.Schema

    import Ecto.Changeset

    @primary_key false
    embedded_schema do
        field(:ingresse_id,     :integer)
        field(:permission,      :string)
        field(:resource,        :string)
        field(:context,         :string)
        field(:resource_value,  :string)
        field(:context_value,   :string)
        field(:company_id,      :integer)
    end

    @fields ~w(
        ingresse_id
        permission
        resource
        resource_value
        context
        context_value
        company_id
    )a

    @required_fields ~w(
        ingresse_id
        permission
        resource
    )a

    def changeset(params) do
      %__MODULE__{}
      |> cast(params, @fields)
      |> validate_required(@required_fields)
    end

    def changeset(validate, params) do
        validate
        |> cast(params, @fields)
        |> validate_required(@required_fields)
    end

    def to_map(%Ecto.Changeset{} = changeset) do
      changeset.changes
      |> Map.take(@fields)
    end
end
