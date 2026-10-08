{
  lib,
  go_1_27,
  mkPulumiPackage,
}:
mkPulumiPackage rec {
  owner = "pulumi";
  repo = "pulumi-random";
  version = "4.21.2";
  rev = "v${version}";
  hash = "sha256-WKCNob0al2Gk/zhSuGbNxqKNntNHp4uRF9WuRNfw5i4=";
  vendorHash = "sha256-fW7+drYBpui7TyWJcPYJfhjnZA5EeAU5sf0dRWbNH4g=";
  cmdGen = "pulumi-tfgen-random";
  cmdRes = "pulumi-resource-random";
  extraLdflags = [
    "-X github.com/pulumi/${repo}/provider/v4/pkg/version.Version=v${version}"
  ];
  go = go_1_27;
  __darwinAllowLocalNetworking = true;
  meta = {
    description = "Pulumi provider that safely enables randomness for resources";
    mainProgram = "pulumi-resource-random";
    homepage = "https://github.com/pulumi/pulumi-random";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [
      veehaitch
    ];
  };
}
