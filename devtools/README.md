# devtools

Development and debugging tools for mical.vim.

## Files

### min-vimrc.vim

Minimal vimrc that loads only this plugin. Useful for manual testing and as a
dependency for other devtools scripts.

```sh
vim -u devtools/min-vimrc.vim path/to/file.mical
```

### dump-syntax.vim

Dumps the syntax highlight group for every character in the current buffer to
`devtools/syntax-dump.txt`. Requires `min-vimrc.vim` to load the plugin.

```sh
vim -u devtools/min-vimrc.vim devtools/example.mical -c 'source devtools/dump-syntax.vim'
cat devtools/syntax-dump.txt
```

Output format (one line per buffer line):

```
  1: micalKey[enabled] micalBoolean[true]
  2: micalComment[# comment]
```

### example.mical

Sample mical file covering all syntax elements: shebang, comments, directives,
booleans, integers, quoted strings, line strings, block strings, and prefix
blocks.
