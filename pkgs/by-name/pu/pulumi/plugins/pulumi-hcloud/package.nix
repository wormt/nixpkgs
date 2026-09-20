{
  lib,
  mkPulumiPackage,
}:
mkPulumiPackage rec {
  owner = "pulumi";
  repo = "pulumi-hcloud";
  version = "1.42.0";
  rev = "v${version}";
  hash = "sha256-GysXGTE/K3nrrLI/HK722Gyo5+Z8bF8DnGuOzzqBoOM=";
  vendorHash = "sha256-VdzEyOm3BDzwjEDh3rJLnaP+zpsnzba4C39a3v5AbrU=";
  cmdGen = "pulumi-tfgen-hcloud";
  cmdRes = "pulumi-resource-hcloud";
  extraLdflags = [
    "-X=github.com/pulumi/${repo}/provider/pkg/version.Version=v${version}"
  ];
  __darwinAllowLocalNetworking = true;
  meta = {
    description = "Hetzner Cloud Pulumi resource package, providing multi-language access to Hetzner Cloud";
    mainProgram = "pulumi-resource-hcloud";
    homepage = "https://github.com/pulumi/pulumi-hcloud";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ tie ];
  };
}
