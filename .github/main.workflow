workflow "Build" {
  on = "push"
  resolves = ["build"]
}

workflow "Release" {
  on = "release"
  resolves = ["ghr-upload-deb","ghr-upload-rpm"]
}


action "generate build files" {
  uses = "./.github/actions/cmake"
  args = " -H. -Bbuild"
}

action "build" {
  needs = ["generate build files"]
  uses = "./.github/actions/cmake"
  args = " --build build"
}

action "package-deb" {
  needs = ["generate build files"]
  uses = "./.github/actions/ubuntu-cmake"
  args = " --clean-first --build build --target package"
}

action "package-rpm" {
  needs = ["generate build files"]
  uses = "./.github/actions/amzn2-cmake"
  args = " --clean-first --build build --target package"
}

action "ghr-upload-deb" {
  uses = "fnkr/github-action-ghr@v1"
  needs = ["package-deb"]
  secrets = ["GITHUB_TOKEN"]
  env = {
    GHR_PATH = "build/*.deb"
  }
}
action "ghr-upload-rpm" {
  uses = "fnkr/github-action-ghr@v1"
  needs = ["package-rpm"]
  secrets = ["GITHUB_TOKEN"]
  env = {
    GHR_PATH = "build/*.rpm"
  }
}
