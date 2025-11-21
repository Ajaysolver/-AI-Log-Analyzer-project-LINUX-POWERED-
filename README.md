[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?style=for-the-badge&logo=github)](https://github.com/yourusername/ai-log-analyzer)
# 🤖 AI-Powered Log Analyzer

An intelligent server monitoring system that uses Google Gemini AI to analyze logs, detect anomalies, and send proactive alerts.

## 🚀 Features

- **AI-Powered Analysis**: Google Gemini integration for intelligent log parsing
- **Multi-Channel Alerts**: Email notifications with intelligent insights
- **Security First**: Automatic data redaction and encryption
- **Real-time Monitoring**: Continuous log analysis
- **Lightweight**: Pure Bash implementation

## 🛠️ Installation

```bash
git clone https://github.com/yourusername/ai-log-analyzer.git
cd ai-log-analyzer
./setup.sh
```
## ⚙️ Configuration
```
Edit config.sh with your settings
Set your Gemini API key:
export GEMINI_API_KEY="your_api_key_here"
Update ALERT_EMAIL in config.sh
```
## 🎯 Usage
```bash
# Basic monitoring
./analyzer.sh

# AI-enabled analysis
./analyzer.sh -a

# Automatic monitoring (cron job)
*/30 * * * * /path/to/analyzer.sh -a >> /path/to/logs/analyzer.log 2>&1
```
## 📁 Project Structure
```
ai-log-analyzer/
├── analyzer.sh          # Main controller
├── config.sh           # Configuration
├── setup.sh           # Setup script
├── functions/         # Modular functions
│   ├── parser.sh     # Log parsing
│   ├── detector.sh   # Anomaly detection
│   ├── gemini_api.sh # AI integration
│   └── alert.sh      # Notification system
└── README.md         # Documentation
```
