{
    enable = true;
    defaultEditor = true;
    settings.theme = "catppuccin_frappe";

    settings.editor.auto-format = false;
    settings.editor.auto-pairs = false;
    settings.editor.auto-save = true;
    # settings.editor.completion-replace = true;
    settings.editor.cursorline = true;
    settings.editor.idle-timeout = 0;
    settings.editor.rulers = [100];
    settings.editor.text-width = 100;

    settings.editor.lsp.goto-reference-include-declaration = false;

    settings.editor.cursor-shape.insert = "bar";

    settings.editor.smart-tab.supersede-menu = true;

    settings.keys.normal.space.space = "file_picker";
    settings.keys.normal.space."," = "buffer_picker";

    settings.editor.whitespace.render.newline = "all";

    languages.language-server.eslint.args = ["--stdio"];
    languages.language-server.eslint.command = "vscode-eslint-language-server";

    languages.language-server.eslint.config.nodePath = "";
    languages.language-server.eslint.config.quiet = false;
    languages.language-server.eslint.config.rulesCustomizations = [];
    languages.language-server.eslint.config.run = "onType";
    languages.language-server.eslint.config.validate = "on";
    languages.language-server.eslint.config.codeAction.disableRuleComment.enable = true;
    languages.language-server.eslint.config.codeAction.disableRuleComment.location = "separateLine";
    languages.language-server.eslint.config.codeAction.showDocumentation.enable = true;
    languages.language-server.eslint.config.problems.shortenToSingleLine = false;

    languages.language-server.jdtls.config.java.autobuild.enabled = true;

    languages.language-server.jdtls.config.java.completion.maxResults = 1000;

    languages.language-server.jdtls.config.java.format.settings.url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml";

    languages.language = [
        {
            name = "typescript";
            language-servers = [ "typescript-language-server" "vscode-eslint-language-server" ];
            indent.tab-width = 4;
            indent.unit = "    ";
        }
        {
            name = "tsx";
            language-servers = [ "typescript-language-server" "vscode-eslint-language-server" ];
            indent.tab-width = 4;
            indent.unit = "    ";
        }
        {
            name = "java";
            indent.tab-width = 4;
            indent.unit = "    ";
        }
    ];
}
