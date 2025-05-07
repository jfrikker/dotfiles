[ (import <rust-overlay>)
(
    final: prev:
        {
        #     vscode-langservers-extracted = 
        #         prev.buildNpmPackage rec {
        #           pname = "vscode-langservers-extracted";
        #           version = "4.8.0";

        #           src = prev.fetchFromGitHub {
        #             owner = "hrsh7th";
        #             repo = pname;
        #             rev = "v${version}";
        #             hash = "sha256-sGnxmEQ0J74zNbhRpsgF/cYoXwn4jh9yBVjk6UiUdK0=";
        #           };

        #           npmDepsHash = "sha256-LFWC87Ahvjf2moijayFze1Jk0TmTc7rOUd/s489PHro=";

        #           buildPhase =
        #             let
        #               extensions =
        #                 if prev.stdenv.isDarwin
        #                 then "${prev.vscodium}/Applications/VSCodium.app/Contents/Resources/app/extensions"
        #                 else "${prev.vscodium}/lib/vscode/resources/app/extensions";
        #             in
        #             ''
        #               npx babel ${extensions}/css-language-features/server/dist/node \
        #                 --out-dir lib/css-language-server/node/
        #               npx babel ${extensions}/html-language-features/server/dist/node \
        #                 --out-dir lib/html-language-server/node/
        #               npx babel ${extensions}/json-language-features/server/dist/node \
        #                 --out-dir lib/json-language-server/node/
        #               npx babel ${extensions}/markdown-language-features/server/dist/node \
        #                 --out-dir lib/markdown-language-server/node/
        #               cp -r ${prev.vscode-extensions.dbaeumer.vscode-eslint}/share/vscode/extensions/dbaeumer.vscode-eslint/server/out \
        #                 lib/eslint-language-server
        #               mv lib/markdown-language-server/node/workerMain.js lib/markdown-language-server/node/main.js
        #             '';
        #           meta = with prev.lib; {
        #             description = "HTML/CSS/JSON/ESLint language servers extracted from vscode";
        #             homepage = "https://github.com/hrsh7th/vscode-langservers-extracted";
        #             license = licenses.mit;
        #             maintainers = with maintainers; [ lord-valen ];
        #           };
        #         };
        }
)
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
