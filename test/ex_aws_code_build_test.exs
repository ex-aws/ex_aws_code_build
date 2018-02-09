defmodule ExAws.CodeBuildTest do
  use ExUnit.Case
  doctest ExAws.CodeBuild

  test "greets the world" do
    assert ExAws.CodeBuild.hello() == :world
  end
end
