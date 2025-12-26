# Ceramica KhUTM

**ML Pottery Classification System for KhUTM Archaeological Collections**

A Machine Learning-based pottery classification system specifically designed for the Khatt University of Technology Museum (KhUTM) archaeological collections. This system classifies decorated pottery sherds by comparing them with the Schmidt 1937 corpus and other reference collections to identify typological parallels and chronological attributions from Umm an-Nar through Iron Age periods.

## Features

- **Pre-configured for KhUTM**: Optimized for the KhUTM pottery database structure
- **Schmidt PDF Integration**: Direct access to Schmidt 1937 reference plates
- **ML Classification**: Computer vision-based similarity matching
- **SQLite Database**: Integrated database with pottery collections
- **Interactive Web Interface**: Real-time classification with visual feedback
- **Batch Processing**: Classify entire collections with progress tracking

## Screenshots

![Interface Preview](static/screenshot.png)

## Requirements

- Python 3.10+
- pip (Python package manager)

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/enzococca/ceramic-khutm.git
cd ceramic-khutm
```

### 2. Create a virtual environment (recommended)

```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Configure environment variables (optional)

Create a `.env` file for custom configuration:

```bash
# ML API URL (default: Railway deployment)
API_URL=https://pottery-comparison-oman.up.railway.app/

# Server port
PORT=5001
```

### 5. Run the application

```bash
python app.py
```

The application will be available at `http://localhost:5001`

## Usage

### Quick Start

1. **Select Collection**: Choose which pottery collection to classify from the dropdown.

2. **Configure Settings**: Set the number of similar matches to find and confidence threshold.

3. **Start Classification**: Click "Start Classification" to begin the ML comparison process.

4. **View Results**: See matched pottery with similarity scores and Schmidt plate references.

### Database Structure

The application uses a SQLite database (`pottery.db`) with the following structure:

- **Pottery Table**: Contains pottery metadata (id, site, area, form, decoration, etc.)
- **Media Table**: Image references and paths
- **Schmidt Collection**: Reference plates from Schmidt 1937 corpus

### Schmidt PDF Access

The system provides direct access to the Schmidt 1937 reference plates. When a match is found, you can view the corresponding plate from the original publication.

## API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/` | GET | Main web interface |
| `/api/collections` | GET | List available collections |
| `/api/start` | POST | Start ML classification |
| `/api/status` | GET | Check classification status |
| `/api/pdf-url` | GET | Get Schmidt PDF URL |

## Project Structure

```
ceramica-khutm/
├── app.py                 # Main Flask application
├── pottery.db             # SQLite database
├── requirements.txt       # Python dependencies
├── templates/
│   └── index.html        # Web interface
├── static/
│   ├── css/              # Stylesheets
│   └── images/           # Static images
├── PDFs/
│   └── Schmidt_Bat.pdf   # Schmidt 1937 reference
└── README.md
```

## ML API

This classifier uses a remote ML API for pottery comparison hosted on Railway:

```
https://pottery-comparison-oman.up.railway.app/
```

The ML model compares visual features of pottery decorations to find similar patterns in the reference collection.

## Configuration

### Default Settings

```python
DEFAULT_CONFIG = {
    'db_path': 'pottery.db',
    'images_path': '/path/to/images',
    'pdf_path': 'PDFs/Schmidt_Bat.pdf',
    'api_url': 'https://pottery-comparison-oman.up.railway.app/'
}
```

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `PORT` | 5001 | Server port |
| `API_URL` | Railway URL | ML API endpoint |
| `DB_PATH` | pottery.db | SQLite database path |

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Author

**Enzo Cocca**

## Related Projects

- [ceramic-classifier](https://github.com/enzococca/ceramic-classifier) - Universal pottery classifier for any database
