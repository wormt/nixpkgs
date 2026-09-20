{
  lib,
  mkPulumiPackage,
  python3Packages,
}:
mkPulumiPackage rec {
  owner = "pulumi";
  repo = "pulumi-kubernetes";
  version = "4.34.1";
  rev = "v${version}";
  hash = "sha256-eXve80Gjfx6tEyWNqUuzfLCe7z4rHRdMOcdkzieeKsM=";
  vendorHash = "sha256-JmKrUWrzqmvbFY7cy0K6T3tvntDBWT/TS1t3Wl1SHdU=";
  cmdGen = "pulumi-gen-kubernetes";
  cmdRes = "pulumi-resource-kubernetes";
  extraLdflags = [
    "-X=github.com/pulumi/${repo}/provider/pkg/version.Version=${version}"
  ];
  pythonArgs.dependencies = with python3Packages; [
    requests
  ];
  meta = {
    description = "Kubernetes resource package, for the Pulumi infrastructure-as-code toolchain";
    mainProgram = "pulumi-resource-kubernetes";
    homepage = "https://www.pulumi.com/docs/reference/clouds/kubernetes/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ nicoo ];
  };
}
