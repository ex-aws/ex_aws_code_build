defmodule ExAws.CodeBuild do
  @moduledoc """
  AWS CodeBuild Service for ExAws
  """

  import ExAws.Utils, only: [camelize_keys: 1]

  @version "2016-10-06"
  @namespace "CodeBuild_20161006"

  @doc "Batch delete builds"
  @spec batch_delete_builds(ids :: [binary()]) :: ExAws.Operation.JSON.t()
  def batch_delete_builds(ids) do
    query_params = %{
      "Action" => "BatchDeleteBuilds",
      "Version" => @version,
      "ids" => ids
    }

    request(:batch_delete_builds, query_params)
  end

  @doc "Batch get builds"
  @spec batch_get_builds(ids :: [binary()]) :: ExAws.Operation.JSON.t()
  def batch_get_builds(ids) when is_binary(ids) do
    batch_get_builds([ids])
  end
  def batch_get_builds(ids) when is_list(ids) do
    query_params = %{
      "Action" => "BatchGetBuilds",
      "Version" => @version,
      "ids" => ids
    }

    request(:batch_get_builds, query_params)
  end

  @doc "Batch get projects"
  @spec batch_get_projects(names :: [binary()]) :: ExAws.Operation.JSON.t()
  def batch_get_projects(names) do
    query_params = %{
      "Action" => "BatchGetProjects",
      "Version" => @version,
      "names" => names
    }

    request(:batch_get_projects, query_params)
  end

  @type create_project_opt :: [
    {:badge_enabled, boolean()} |
    {:cache, map()} |
    {:encryption_key, binary()} |
    {:service_role, binary()} |
    {:tags, [map()]} |
    {:timeout_in_minutes, pos_integer()} |
    {:vpc_config, map()}
  ]

  @doc "Create a new CodeBuild project"
  @spec create_project(
    artifacts :: map(),
    environment :: map(),
    name :: binary(),
    source :: map()) :: ExAws.Operation.JSON.t()
  @spec create_project(
    artifacts :: map(),
    environment :: map(),
    name :: binary(),
    source :: map(),
    opts :: create_project_opt()) :: ExAws.Operation.JSON.t()
  def create_project(artifacts, environment, name, source, opts \\ []) do
    query_params = opts
    |> normalize_opts()
    |> Map.merge(%{
      "Action" => "CreateProject",
      "Version" => @version,
      "artifacts" => normalize_opts(artifacts),
      "environment" => normalize_opts(environment),
      "name" => name,
      "source" => normalize_opts(source)})

    request(:create_project, query_params)
  end

  @doc "Create webhook"
  @spec create_webhook(project_name :: binary()) :: ExAws.Operation.JSON.t()
  def create_webhook(project_name) do
    query_params = %{
      "Action" => "CreateWebhook",
      "Version" => @version,
      "projectName" => project_name
    }

    request(:create_webhook, query_params)
  end

  @doc "Delete project"
  @spec delete_project(project_name :: binary()) :: ExAws.Operation.JSON.t()
  def delete_project(project_name) do
    query_params = %{
      "Action" => "DeleteProject",
      "Version" => @version,
      "projectName" => project_name
    }

    request(:delete_project, query_params)
  end

  @doc "Delete webhook"
  @spec delete_webhook(project_name :: binary()) :: ExAws.Operation.JSON.t()
  def delete_webhook(project_name) do
    query_params = %{
      "Action" => "DeleteWebhook",
      "Version" => @version,
      "projectName" => project_name
    }

    request(:delete_webhook, query_params)
  end

  @doc "List builds"
  @spec list_builds() :: ExAws.Operation.JSON.t()
  @spec list_builds(opts :: Keyword.t()) :: ExAws.Operation.JSON.t()
  def list_builds(opts \\ []) do
    query_params = opts
    |> normalize_opts()
    |> Map.merge(%{
        "Action" => "ListBuilds",
        "Version" => @version})

    request(:list_builds, query_params)
  end

  @doc "List builds for project"
  @spec list_builds_for_project(project_name :: binary()) :: ExAws.Operation.JSON.t()
  @spec list_builds_for_project(project_name :: binary(), Keyword.t()) :: ExAws.Operation.JSON.t()
  def list_builds_for_project(project_name, opts \\ []) do
    query_params = opts
    |> normalize_opts()
    |> Map.merge(%{
        "Action" => "ListBuildsForProject",
        "Version" => @version,
        "projectName" => project_name})

    request(:list_builds_for_project, query_params)
  end

  @doc "List curated environment images"
  @spec list_curated_environment_images() :: ExAws.Operation.JSON.t()
  def list_curated_environment_images do
    query_params = %{
      "Action" => "ListCuratedEnvironmentImages",
      "Version" => @version
    }

    request(:list_curated_environment_images, query_params)
  end

  @doc "List projects"
  @spec list_projects() :: ExAws.Operation.JSON.t()
  @spec list_projects(opts :: Keyword.t()) :: ExAws.Operation.JSON.t()
  def list_projects(opts \\ []) do
    query_params = opts
    |> normalize_opts()
    |> Map.merge(%{
        "Action" => "ListProjects",
        "Version" => @version})

    request(:list_projects, query_params)
  end

  @doc "Start build"
  @spec start_build(project_name :: binary(), opts :: Keyword.t()) :: ExAws.Operation.JSON.t()
  def start_build(project_name, opts \\ []) do
    query_params = opts
    |> normalize_opts()
    |> Map.merge(%{
        "Action" => "StartBuild",
        "Version" => @version,
        "projectName" => project_name})

    request(:start_build, query_params)
  end

  @doc "Stop build"
  @spec stop_build(id :: binary()) :: ExAws.Operation.JSON.t()
  def stop_build(id) do
    query_params = %{
      "Action" => "StopBuild",
      "Version" => @version,
      "id" => id
    }

    request(:stop_build, query_params)
  end

  @type update_project_opts :: [
    {:artifacts, map()} |
    {:badge_enabled, boolean()} |
    {:cache, map()} |
    {:description, binary()} |
    {:encryption_key, binary()} |
    {:environment, map()} |
    {:name, binary()} |
    {:service_role, binary()} |
    {:source, map()} |
    {:tags, [map()]} |
    {:timeout_in_minutes, pos_integer()} |
    {:vpc_config, map()}
  ]

  @doc "Update project"
  @spec update_project(project_name :: binary()) :: ExAws.Operation.JSON.t()
  @spec update_project(project_name :: binary(), opts :: update_project_opts()) :: ExAws.Operation.JSON.t()
  def update_project(project_name, opts \\ []) do
    query_params = opts
    |> normalize_opts()
    |> Map.merge(%{
      "Action" => "UpdateProject",
      "Version" => @version,
      "name" => project_name
      })

    request(:update_project, query_params)
  end

  defp request(action, params, opts \\ %{}) do
    operation =
      action
      |> Atom.to_string()
      |> Macro.camelize()

    ExAws.Operation.JSON.new(:codebuild, %{
          data: params,
          headers: [
            {"x-amz-target", "#{@namespace}.#{operation}"},
            {"content-type", "application/x-amz-json-1.1"}
          ]
    } |> Map.merge(opts))
  end

  # This JSON API requires lower camelCased parameters.
  defp normalize_opts(opts) do
    opts
    |> Enum.into(%{})
    |> camelize_keys()
    |> Enum.reduce(%{},
      fn({k, v}, acc) ->
        Map.put(acc, to_lower_camel_case(k), v)
      end)
  end

  defp to_lower_camel_case(string) do
    {first, rest} = String.split_at(string, 1)

    String.downcase(first) <> rest
  end
end
