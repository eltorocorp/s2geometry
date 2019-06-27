workflow "Build" {
  on = "push"
  resolves = ["build"]
}


action "generate build files" {
  uses = ".github/actions/cmake"
  args = " -H. -Bbuild"
} 

action "build" {
  uses = ".github/actions/cmake"
  args = " --build build"
  resolves = ["generate build files"]
}

