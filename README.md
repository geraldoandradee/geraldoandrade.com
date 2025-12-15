# Geraldo Andrade's Resumé

Personal portfolio and CV website hosted at [geraldoandrade.com](https://geraldoandrade.com).

## Project Structure

```
docs/
├── index.html          # Main portfolio website
├── cv.html             # PDF-friendly CV layout (two-column A4)
├── css/
│   ├── resume.css      # Main site styles
│   └── cv-pdf.css      # PDF layout styles
├── img/                # Images and favicons
├── pdf/                # PDF files
└── vendor/             # Third-party libraries (Bootstrap, FontAwesome, jQuery)
```

## Running Locally

### Using Docker

```bash
docker-compose up
```

The site will be available at `http://localhost:8080`.

### Using any HTTP server

```bash
cd docs
python -m http.server 8080
# or
npx serve .
```

## Generating the PDF CV

The `cv.html` file is a print-optimized two-column layout designed for A4 paper.

### Option A: Browser (Manual)

1. Open `docs/cv.html` in Chrome or Edge
2. Press `Ctrl+P` (or `Cmd+P` on Mac)
3. Configure print settings:
   - **Destination**: Save as PDF
   - **Margins**: None
   - **Scale**: 100%
   - **Background graphics**: Enabled
4. Click **Save**

### Option B: Command Line (Headless Chrome)

```bash
google-chrome --headless --disable-gpu --no-sandbox \
  --print-to-pdf="docs/pdf/CV-Geraldo-Andrade.pdf" \
  --print-to-pdf-no-header \
  "file://$(pwd)/docs/cv.html"
```

Or with Chromium:

```bash
chromium-browser --headless --disable-gpu --no-sandbox \
  --print-to-pdf="docs/pdf/CV-Geraldo-Andrade.pdf" \
  --print-to-pdf-no-header \
  "file://$(pwd)/docs/cv.html"
```

## Deployment

The site is deployed via GitHub Pages from the `docs/` folder on the `main` branch.

## License

See [LICENSE](LICENSE) file.
