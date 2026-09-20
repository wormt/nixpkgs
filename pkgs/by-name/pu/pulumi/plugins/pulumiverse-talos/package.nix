{
  lib,
  mkPulumiPackage,
}:
mkPulumiPackage rec {
  owner = "pulumiverse";
  repo = "pulumi-talos";
  version = "0.8.1";
  rev = "v${version}"; # TODO: add support for `tag`
  hash = "sha256-iioZkVD7pCt5DXyeT1qmSrwUDMq6hZT9jrTl0GTRM9Q=";
  vendorHash = "sha256-RTHCFra/mUsJnKVGSEcUrSI8PSAdpXkm3bPifd6mNyA=";
  cmdGen = "pulumi-tfgen-talos";
  cmdRes = "pulumi-resource-talos";
  extraLdflags = [
    "-X=github.com/${owner}/${repo}/provider/pkg/version.Version=${version}"
  ];
  pythonArgs.pname = "pulumiverse_talos";
  meta = {
    description = "Talos Linux resource package, providing IaC configuration of Talos k8s clusters";
    mainProgram = cmdRes;
    homepage = "https://www.pulumi.com/registry/packages/talos/";
    license = lib.licenses.mpl20;
    maintainers = with lib.maintainers; [
      nicoo
    ];
  };
}
