workflow "Build" {
  on = "push"
  resolves = ["build"]
}

workflow "Release" {
  on = "release"
  resolves = ["release"]
}


action "ubnt.buildgen" {
  uses = "./.github/actions/ubnt-cmake"
  args = " -H. -Bbuild.ubnt"
}
action "amzn2.buildgen" {
  uses = "./.github/actions/amzn2-cmake"
  args = " -H. -Bbuild.amzn2"
}

action "build" {
  needs = ["ubnt.buildgen"]
  uses = "./.github/actions/ubnt-cmake"
  args = " --build build.ubnt"
}

action "ubnt.package" {
  needs = ["ubnt.buildgen"]
  uses = "./.github/actions/ubnt-cmake"
  args = " --build build.ubnt --target package"
}

action "amzn2.package" {
  needs = ["amzn2.buildgen"]
  uses = "./.github/actions/amzn2-cmake"
  args = " --build build.amzn2 --target package"
}

action "release.collect" {
  uses = "actions/bin/sh@master"
  args = ["mkdir -p dist","cp build.*/*.rpm dist/","cp build.*/*.deb dist/"]
  needs = ["ubnt.package","amzn2.package"]
}

action "release" {
  uses = "fnkr/github-action-ghr@v1"
  needs = ["release.collect"]
  secrets = ["GITHUB_TOKEN"]
  env = {
    GHR_PATH = "dist/"
  }
}
