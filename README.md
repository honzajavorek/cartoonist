# cartoonist

Tool to help lazy cartoonists to convert photo of a hand drawing into an SVG/PDF vector file

## Installation

```shell
$ ./install.sh
```

- Installs system dependencies.
- Installs necessary [Fred's ImageMagick Scripts](http://www.fmwconcepts.com/imagemagick/).

> **Note:** Only [Homebrew](http://brew.sh/) is supported as of now. Feel free to contribute installation of dependencies on your favorite system.

## Usage

```shell
$ ./cartoonist.sh photo-of-my-drawing.jpg
```

### Produces

- `photo-of-my-drawing.png` - PNG, black/transparent
- `photo-of-my-drawing-i.png` - PNG, white/transparent
- `photo-of-my-drawing.pdf` - PDF, black/transparent
- `photo-of-my-drawing-i.pdf` - PDF, white/transparent
- `photo-of-my-drawing.svg` - SVG, black/transparent
- `photo-of-my-drawing-i.svg` - SVG, white/transparent

### Why?

- Black versions are useful for embedding the image on light backgrounds.
- White versions are useful for embedding the image on dark backgrounds.
- PNG versions are sometimes useful.
- PDF versions can be imported to Keynote as vector graphics.
- SVG versions can be imported to anywhere else than Keynote as vector graphics.

## Tests

I assembled a little test suite (or rather _verification-by-eye_ suite) to develop this script. Feel free to use it. Sample images are in the `test` directory. You can run the suite by executing `./test.sh`. It uses throwaway `./build` directory where it produces the results.
