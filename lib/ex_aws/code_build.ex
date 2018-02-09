defmodule ExAws.CodeBuild do
  @moduledoc """
  AWS CodeBuild Service.

  Uses JSON protocol.

  """
  import ExAws.Utils

  @version "2016-10-06"

  @spec batch_delete_builds([binary()]) :: ExAws.Operation.JSON.t()
  def batch_delete_builds(ids) do
    query_params = %{
      "Action" => "BatchDeleteBuilds",
      "Version" => @version,
      "ids" => ids
    }

    request(:batch_delete_builds, query_params)
  end

  @spec batch_get_builds([binary()]) :: ExAws.Operation.JSON.t()
  def batch_get_builds(ids) do
    query_params = %{
      "Action" => "BatchGetBuilds",
      "Version" => @version,
      "ids" => ids
    }

    request(:batch_get_builds, query_params)
  end

  @spec batch_get_projects([binary()]) :: ExAws.Operation.JSON.t()
  def batch_get_projects(names) do
    query_params = %{
      "Action" => "BatchGetProjects",
      "Version" => @version,
      "names" => names
    }

    request(:batch_get_projects, query_params)
  end

  def create_project do

  end

  def create_webhook do

  end

  def delete_project do

  end

  def delete_webhook do

  end

  @spec list_builds() :: ExAws.Operation.JSON.t()
  @spec list_builds(Keyword.t) :: ExAws.Operation.JSON.t()
  def list_builds(opts \\ []) do
    query_params = opts
    |> normalize_opts()
    |> Map.merge(%{
        "Action" => "ListBuilds",
        "Version" => @version})

    request(:list_builds, query_params)
  end

  @spec list_builds_for_project(binary()) :: ExAws.Operation.JSON.t()
  @spec list_builds_for_project(binary(), Keyword.t()) :: ExAws.Operation.JSON.t()
  def list_builds_for_project(project_name, opts \\ []) do
    query_params = opts
    |> normalize_opts()
    |> Map.merge(%{
        "Action" => "ListBuildsForProject",
        "Version" => @version,
        "projectName" => project_name})

    request(:list_builds_for_project, query_params)
  end

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
  @spec list_projects(Keyword.t()) :: ExAws.Operation.JSON.t()
  def list_projects(opts \\ []) do
    query_params = opts
    |> normalize_opts()
    |> Map.merge(%{
        "Action" => "ListProjects",
        "Version" => @version})

    request(:list_projects, query_params)
  end

  @spec start_build(binary(), Keyword.t()) :: ExAws.Operation.JSON.t()
  def start_build(project_name, opts \\ []) do
    query_params = opts
    |> normalize_opts()
    |> Map.merge(%{
        "Action" => "StartBuild",
        "Version" => @version,
        "projectName" => project_name})

    request(:start_build, query_params)
  end

  @spec stop_build(binary()) :: ExAws.Operation.JSON.t()
  def stop_build(id) do
    query_params = %{
      "Action" => "StopBuild",
      "Version" => @version,
      "id" => id
    }

    request(:stop_build, query_params)
  end

  def update_project do

  end

  defp request(action, params, opts \\ %{}) do
    operation =
      action
      |> Atom.to_string()
      |> Macro.camelize()

    ExAws.Operation.JSON.new(:codebuild, %{
          data: params,
          headers: [
            {"x-amz-target", "CodeBuild_20161006.#{operation}"},
            {"content-type", "application/x-amz-json-1.1"},
          ]
    } |> Map.merge(opts))
  end

  defp normalize_opts(opts) do
    opts
    |> Enum.into(%{})
    |> camelize_keys()
  end
end
