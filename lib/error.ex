defmodule Acl.Error do
  @moduledoc """
  Access Control List Error Messages
  """
  def message(code), do: messages() |> Map.get(code)

  defp messages do
    %{
      5000 => "PERMISSION_NOT_FOUND",
      5001 => "PERMISSION_UNABLE_REMOVAL",
      5004 => "ROLE_NOT_FOUND",
      5005 => "ROLE_UNABLE_REMOVAL",
      5006 => "ROLE_SYSTEM_DENIED_REMOVAL",
      5007 => "RESOURCE_NOT_FOUND",
      5008 => "RESOURCE_UNABLE_REMOVAL",
      5009 => "USER_NOT_FOUND",
      5010 => "USER_UNABLE_REMOVAL",
      5011 => "ROLE_SYSTEM_FLAGGED_DENIED_UPDATE",
      5013 => "PERMISSION_INTEGRITY_ERROR",
      5014 => "RESOURCE_INTEGRITY_ERROR",
      5015 => "ROLE_INTEGRITY_ERROR",
      5016 => "USER_INTEGRITY_ERROR",
      5017 => "DATA_TO_LONG_ERROR",
      5018 => "USER_UNABLE_TO_ASSOCIATE_ROLE",
      5019 => "USER_UNABLE_TO_DISASSOCIATE_ROLE",
      5020 => "USER_ROLE_NOT_FOUND",
      5021 => "ROLE_UNABLE_TO_ASSOCIATE_PERM",
      5022 => "ROLE_UNABLE_TO_DISASSOCIATE_PERM",
      5023 => "CONTEXT_NOT_FOUND",
      5024 => "CONTEXT_UNABLE_REMOVAL",
      5025 => "CONTEXT_INTEGRITY_ERROR",
      4000 => "ALL_PARAMETERS_REQUIRED",
      4001 => "PERMISSION_ID_REQUIRED",
      4002 => "PERMISSION_ID_INTEGER",
      4003 => "RESOURCE_VALUE_REQUIRED",
      4005 => "ROLE_ID_REQUIRED",
      4006 => "ROLE_ID_INTEGER",
      4007 => "RESOURCE_ID_REQUIRED",
      4008 => "RESOURCE_ID_INTEGER",
      4009 => "EMAIL_REQUIRED",
      4010 => "INGRESSE_ID_INTEGER",
      4011 => "USER_ID_REQUIRED",
      4012 => "USER_ID_INTEGER",
      4013 => "PERMISSIONS_ARRAY",
      4014 => "RESOURCE_NAME_REQUIRED",
      4015 => "PERMISSION_NAME_REQUIRED",
      4016 => "INGRESSE_ID_REQUIRED",
      4017 => "PERMISSIONS_OBJECTS_MALFORMED",
      4018 => "CONTEXT_ID_REQUIRED",
      4019 => "CONTEXT_ID_INTEGER",
      4020 => "JSON_REQUEST_TYPE",
      4021 => "RESOURCES_OBJECTS_MALFORMED",
      4022 => "CONTEXTS_OBJECTS_MALFORMED",
      4023 => "SYSTEM_BOOLEAN",
      4024 => "ROLES_OBJECTS_MALFORMED",
      4025 => "CONTEXT_REQUIRED",
      4026 => "RESOURCE_REQUIRED",
      4027 => "PERMISSION_REQUIRED",
      4028 => "ROLE_REQUIRED",
      4029 => "SYSTEM_REQUIRED"
    }
  end
end
