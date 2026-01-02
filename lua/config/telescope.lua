require('telescope').setup({
    defaults = {
        -- Use standard GNU grep for live_grep
        vimgrep_arguments = {
            "grep",
            "--extended-regexp",
            "--color=never",
            "--with-filename",
            "--line-number",
            "--ignore-case",
            "--recursive",
            "--no-messages",
            "--binary-files=without-match",
        },
    },
    pickers = {
        live_grep = {
            -- Override the grep command for live_grep specifically
            vimgrep_arguments = {
                "grep",
                "--extended-regexp",
                "--color=never",
                "--with-filename",
                "--line-number",
                "--ignore-case",
                "--recursive",
                "--no-messages",
                "--binary-files=without-match",
            },
        },
    },
})
