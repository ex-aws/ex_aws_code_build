defmodule ExAws.CodeBuild.CodeBuildTest do
  use ExUnit.Case, async: true
  doctest ExAws.CodeBuild

  test "batch_delete_builds" do
    req = ExAws.CodeBuild.batch_delete_builds(["id1", "id2"])

    expected = %{
      "Action" => "BatchDeleteBuilds",
      "Version" => "2016-10-06",
      "ids" => ["id1", "id2"]
    }

    assert req.data == expected
    assert req.headers == [
        {"x-amz-target", "CodeBuild_20161006.BatchDeleteBuilds"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
  end

  test "batch_get_builds" do
    req = ExAws.CodeBuild.batch_get_builds(["id1", "id2"])

    expected = %{
      "Action" => "BatchGetBuilds",
      "Version" => "2016-10-06",
      "ids" => ["id1", "id2"]
    }

    assert req.data == expected
    assert req.headers == [
        {"x-amz-target", "CodeBuild_20161006.BatchGetBuilds"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
  end

  test "batch_get_projects" do
    req = ExAws.CodeBuild.batch_get_projects(["name1", "name2"])

    expected = %{
      "Action" => "BatchGetProjects",
      "Version" => "2016-10-06",
      "names" => ["name1", "name2"]
    }

    assert req.data == expected
    assert req.headers == [
        {"x-amz-target", "CodeBuild_20161006.BatchGetProjects"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
  end

  test "create_project" do
    artifacts = %{"type" => "NO_ARTIFACTS"}

    environment = %{
      "computeType" => "BUILD_GENERAL1_SMALL",
      "environmentVariables" => [
        %{"name" => "ENV_VAR_1", "type" => "PLAINTEXT", "value" => "YOUR_ENV_VAR"}
      ],
      "image" => "repo/your-image:1.0",
      "privilegedMode" => false,
      "type" => "LINUX_CONTAINER"
    }

    source = %{
      "insecureSsl" => false,
      "location" => "your_bucket/path/code.zip",
      "reportBuildStatus" => false,
      "type" => "S3"
    }

    opts = [
      vpc_config: %{"securityGroupids" => ["sg1", "sg2"], "subnets" => ["sn1"], "vpcId" => "vpc-12345"},
      description: "Your Description",
      service_role: "arn:aws:iam::1234567890/role/your-role",
      badge_enabled: false,
      cache: %{"type" => "NO_CACHE"},
      encryption_key: "arn:aws:kms:us-west-2:1234567890:alias/aws/s3",
      tags: ["your-tag"],
      timeout_in_minutes: 60]

    req = ExAws.CodeBuild.create_project(artifacts, environment, "test-project", source, opts)

    expected = %{
      "Action" => "CreateProject",
      "Version" => "2016-10-06",
      "artifacts" => %{"type" => "NO_ARTIFACTS"},
      "badgeEnabled" => false,
      "cache" => %{"type" => "NO_CACHE"},
      "description" => "Your Description",
      "encryptionKey" => "arn:aws:kms:us-west-2:1234567890:alias/aws/s3",
      "environment" => %{
        "computeType" => "BUILD_GENERAL1_SMALL",
        "environmentVariables" => [
          %{"name" => "ENV_VAR_1", "type" => "PLAINTEXT", "value" => "YOUR_ENV_VAR"}
        ],
        "image" => "repo/your-image:1.0",
        "privilegedMode" => false,
        "type" => "LINUX_CONTAINER"
      },
      "name" => "test-project",
      "serviceRole" => "arn:aws:iam::1234567890/role/your-role",
      "source" => %{
        "insecureSsl" => false,
        "location" => "your_bucket/path/code.zip",
        "reportBuildStatus" => false,
        "type" => "S3"
      },
      "tags" => ["your-tag"],
      "timeoutInMinutes" => 60,
      "vpcConfig" => %{
        "securityGroupids" => ["sg1", "sg2"],
        "subnets" => ["sn1"],
        "vpcId" => "vpc-12345"
      }
    }

    assert req.data == expected
    assert req.headers == [{"x-amz-target", "CodeBuild_20161006.CreateProject"}, {"content-type", "application/x-amz-json-1.1"}]
  end

  test "create_webhook" do
    req = ExAws.CodeBuild.create_webhook("test-project")

    assert req.data == %{"Action" => "CreateWebhook", "Version" => "2016-10-06", "projectName" => "test-project"}
    assert req.headers == [{"x-amz-target", "CodeBuild_20161006.CreateWebhook"}, {"content-type", "application/x-amz-json-1.1"}]
  end

  test "delete_project" do
    req = ExAws.CodeBuild.delete_project("test-project")

    expected = %{
      "Action" => "DeleteProject",
      "Version" => "2016-10-06",
      "projectName" => "test-project"
    }

    assert req.data == expected
    assert req.headers == [
        {"x-amz-target", "CodeBuild_20161006.DeleteProject"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
  end

  test "delete_webhook" do
    req = ExAws.CodeBuild.delete_webhook("test-project")

    expected = %{
      "Action" => "DeleteWebhook",
      "Version" => "2016-10-06",
      "projectName" => "test-project"
    }

    assert req.data == expected
    assert req.headers == [
        {"x-amz-target", "CodeBuild_20161006.DeleteWebhook"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
  end

  test "list_builds" do
    req = ExAws.CodeBuild.list_builds()

    expected = %{
      "Action" => "ListBuilds",
      "Version" => "2016-10-06"
    }

    assert req.data == expected
    assert req.headers == [
        {"x-amz-target", "CodeBuild_20161006.ListBuilds"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
  end

  test "list_builds_for_project" do
    req = ExAws.CodeBuild.list_builds_for_project("test-project")

    expected = %{
      "Action" => "ListBuildsForProject",
      "Version" => "2016-10-06",
      "projectName" => "test-project"
    }

    assert req.data == expected
    assert req.headers == [
        {"x-amz-target", "CodeBuild_20161006.ListBuildsForProject"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
  end

  test "list_curated_environment_images" do
    req = ExAws.CodeBuild.list_curated_environment_images()

    expected = %{
      "Action" => "ListCuratedEnvironmentImages",
      "Version" => "2016-10-06"
    }

    assert req.data == expected
    assert req.headers == [
        {"x-amz-target",
         "CodeBuild_20161006.ListCuratedEnvironmentImages"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
  end

  test "list_projects" do
    req = ExAws.CodeBuild.list_projects()

    expected = %{
      "Action" => "ListProjects",
      "Version" => "2016-10-06"
    }

    assert req.data == expected
    assert req.headers == [
        {"x-amz-target", "CodeBuild_20161006.ListProjects"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
  end

  test "start_build" do
    req = ExAws.CodeBuild.start_build("test-project")

    expected = %{
      "Action" => "StartBuild",
      "Version" => "2016-10-06",
      "projectName" => "test-project"
    }

    assert req.data == expected
    assert req.headers == [
        {"x-amz-target", "CodeBuild_20161006.StartBuild"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
  end

  test "stop_build" do
    req = ExAws.CodeBuild.stop_build("id1")

    expected = %{
      "Action" => "StopBuild",
      "Version" => "2016-10-06",
      "id" => "id1"
    }

    assert req.data == expected
    assert req.headers == [
        {"x-amz-target", "CodeBuild_20161006.StopBuild"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
  end

  test "update_project" do
    environment = %{
      "computeType" => "BUILD_GENERAL1_SMALL",
      "environmentVariables" => [
        %{"name" => "ENV_VAR_1", "type" => "PLAINTEXT", "value" => "YOUR_ENV_VAR"}
      ],
      "image" => "repo/your-image:1.0",
      "privilegedMode" => false,
      "type" => "LINUX_CONTAINER"
    }

    source = %{
      "insecureSsl" => false,
      "location" => "your_bucket/path/code.zip",
      "reportBuildStatus" => false,
      "type" => "S3"
    }

    opts = [
      environment: environment,
      source: source
    ]

    req = ExAws.CodeBuild.update_project("test-project", opts)

    expected = %{
      "Action" => "UpdateProject",
      "Version" => "2016-10-06",
      "name" => "test-project",
      "environment" => %{
        "computeType" => "BUILD_GENERAL1_SMALL",
        "environmentVariables" => [
          %{"name" => "ENV_VAR_1", "type" => "PLAINTEXT", "value" => "YOUR_ENV_VAR"}
        ],
        "image" => "repo/your-image:1.0",
        "privilegedMode" => false,
        "type" => "LINUX_CONTAINER"
      },
      "source" => %{
        "insecureSsl" => false,
        "location" => "your_bucket/path/code.zip",
        "reportBuildStatus" => false,
        "type" => "S3"
      }
    }

    assert req.data == expected
    assert req.headers == [
        {"x-amz-target", "CodeBuild_20161006.UpdateProject"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
  end
end
