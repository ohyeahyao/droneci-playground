local Pipeline(name, image) = {
  kind: "pipeline",
  type: "kubernetes",
  name: name,
  steps: [
    {
      name: "test",
      image: image,
      commands: [
        "cargo build --verbose --all",
        "cargo test --verbose --all"
      ]
    }
  ]
};

[
  // Pipeline("rust-1-29", "rust:1.29"),
  Pipeline("rust-1-30", "rust:1.30"),
]