[ (import <rust-overlay>)
# (
#     final: prev:
#         {
#             helix = prev.rustPlatform.buildRustPackage rec {
#                 pname = "helix";
#                 version = "master";

#                 # This release tarball includes source code for the tree-sitter grammars,
#                 # which is not ordinarily part of the repository.
#                 src = prev.fetchzip {
#                     # url = "https://github.com/helix-editor/helix/releases/download/${version}/helix-${version}-source.tar.xz";
#                     url = "https://github.com/helix-editor/helix/archive/109f53fb60f1b126c4c9afd97dd75972725d04ac.zip";
#                     hash = "sha256-WzxaZ+X5HGen81EWVi0dirMzH4xSh4hV1flXSLl0P1k=";
#                     stripRoot = false;
#                 };

#                 cargoHash = "sha256-THzPUVcmboVJHu3rJ6rev3GrkNilZRMlitCx7M1+HBE=";

#                 nativeBuildInputs = [ prev.git prev.installShellFiles prev.makeWrapper ];

#                 postInstall = ''
#                     # not needed at runtime
#                     rm -r runtime/grammars/sources

#                     mkdir -p $out/lib
#                     cp -r runtime $out/lib
#                     installShellCompletion contrib/completion/hx.{bash,fish,zsh}
#                     mkdir -p $out/share/{applications,icons/hicolor/256x256/apps}
#                     cp contrib/Helix.desktop $out/share/applications
#                     cp contrib/helix.png $out/share/icons/hicolor/256x256/apps
#                 '';
#                 postFixup = ''
#                     wrapProgram $out/bin/hx --set HELIX_RUNTIME $out/lib/runtime
#                 '';

#                 meta = with prev.lib; {
#                     description = "A post-modern modal text editor";
#                     homepage = "https://helix-editor.com";
#                     license = licenses.mpl20;
#                     mainProgram = "hx";
#                     maintainers = with prev.maintainers; [ danth yusdacra zowoq ];
#                 };
#             };
#         }
# )
 ]
