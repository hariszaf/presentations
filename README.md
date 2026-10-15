# presentations
Here is a repo for my presentations 

## Compiling the slides

The decks use `friendly-polylux:0.1.0`, which pulls in `tiaoma:0.2.1`.
That package calls `image.decode`, which was removed in Typst 0.14,
so these decks must be compiled with **Typst 0.13.1**.

### Typst 0.13 next to the latest version

```bash
mkdir -p ~/.local/opt/typst-0.13
curl -L https://github.com/typst/typst/releases/download/v0.13.1/typst-x86_64-unknown-linux-musl.tar.xz \
  | tar -xJ -C ~/.local/opt/typst-0.13 --strip-components=1
echo "alias typst13='~/.local/opt/typst-0.13/typst'" >> ~/.bashrc
```

```bash
typst13 compile slides.typ   # one-off build
typst13 watch slides.typ     # rebuild on every save
```

The `image.decode is deprecated` warning is harmless.

### VS Code (Tinymist)

Tinymist bundles its own Typst, so point it to a 0.13 build in `.vscode/settings.json`:

```json
{
  "tinymist.serverPath": "/home/micro/.local/opt/tinymist-0.13/tinymist"
}
```

Binary: https://github.com/Myriad-Dreamin/tinymist/releases/tag/v0.13.12 (`tinymist-linux-x64`).

- `.vscode` is only read from the folder opened in VS Code, so copy it into each deck folder you open directly.
- Do not set `tinymist.exportPdf` (the newer extension and the old server disagree → "cannot use 'in' operator" error).
  Build the PDF with the `typst13 watch` task (Ctrl+Shift+P → Run Task) instead.
- Use a PDF viewer that reloads on change (Evince, or Okular with auto-reload), or the Tinymist preview (Ctrl+K V).

### Fonts

Install fonts into `~/.local/share/fonts/` and run `fc-cache -f`.
Typst does not read `.woff2`; convert them first:

```bash
python3 -m fontTools.ttLib.woff2 decompress -o Font.ttf Font.woff2   # needs: pip install fonttools brotli
```

Check what Typst sees with `typst13 fonts`.

### Logo on the title slide

Paths are relative to the `.typ` file:

```typst
logo: image("figs/microbetag_logo.png", height: 3em),
```

Use `logo: none` to show nothing.
