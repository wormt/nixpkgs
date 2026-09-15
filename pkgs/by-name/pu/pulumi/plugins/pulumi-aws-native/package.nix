{
  lib,
  mkPulumiPackage,
}:
mkPulumiPackage rec {
  owner = "pulumi";
  repo = "pulumi-aws-native";
  version = "1.79.0";
  rev = "v${version}";
  hash = "sha256-o4x1BdaQbM7pdGGJLHwJ3skmrlJBW/P4AMAAWbp92Nc=";
  vendorHash = "sha256-ccDzrFVCbEHEo/7M8EmiV7q1QyggBkCfymEC19KaFfc=";
  cmdGen = "pulumi-gen-aws-native";
  cmdRes = "pulumi-resource-aws-native";
  extraLdflags = [
    "-X github.com/pulumi/${repo}/provider/pkg/version.Version=v${version}"
  ];

  fetchSubmodules = true;
  postConfigure = ''
    pushd ..

    gzip -nc provider/cmd/${cmdRes}/schema.json > provider/cmd/${cmdRes}/schema.json.gz
    gzip -nc provider/cmd/${cmdRes}/metadata.json > provider/cmd/${cmdRes}/metadata.json.gz

    popd
  '';

  __darwinAllowLocalNetworking = true;

  meta = {
    description = "Native AWS Pulumi Provider";
    mainProgram = "pulumi-resource-aws-native";
    homepage = "https://github.com/pulumi/pulumi-aws-native";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [
      veehaitch
    ];
  };
}
