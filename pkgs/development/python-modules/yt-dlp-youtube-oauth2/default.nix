{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  gitUpdater,
}:

buildPythonPackage rec {
  pname = "yt-dlp-youtube-oauth2";
  version = "2024.9.29";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "coletdjnz";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-qtChJwOi8xsG7/P+OVI6/1UMVxc1Vtiy5J4G4D8LKl4=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "yt_dlp_plugins" ];

  passthru = {
    updateScript = gitUpdater {
      rev-prefix = "v";
    };
  };

  meta = {
    description = "Plugin that adds OAuth2 login support to yt-dlp's YouTube extractors";
    homepage = "https://github.com/coletdjnz/yt-dlp-youtube-oauth2";
    changelog = "https://github.com/coletdjnz/yt-dlp-youtube-oauth2/releases/tag/v${version}";
    license = lib.licenses.unlicense;
    maintainers = with lib.maintainers; [ dandraghas ];
  };
}
