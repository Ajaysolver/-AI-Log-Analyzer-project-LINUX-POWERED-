[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?style=for-the-badge&logo=github)](https://github.com/yourusername/ai-log-analyzer)
# 🤖 AI-Powered Log Analyzer

An intelligent server monitoring system that uses Google Gemini AI to analyze logs, detect anomalies, and send proactive alerts.
## About

### 🤔 The Problem
System administrators spend hours daily manually checking server logs, struggling to distinguish critical issues from normal operations. Traditional monitoring tools provide raw data but lack intelligent analysis, leading to alert fatigue and missed critical events.

### 💡 The Solution
AI-Powered Log Analyzer bridges this gap by combining the reliability of Bash scripting with the intelligence of Google Gemini AI. It automatically:
- **Analyzes** log patterns using advanced AI
- **Explains** errors in plain English with actionable insights
- **Alerts** proactively with prioritized notifications
- **Learns** from your environment to improve over time

### 🎯 Why It Matters
- **Time Savings**: Reduces manual monitoring from hours to minutes
- **Early Detection**: Identifies issues before they cause downtime
- **Accessible AI**: Makes advanced AI analysis available to all skill levels
- **Open Source**: No licensing costs with enterprise-grade capabilities

### 🏗️ Technical Innovation
Built with a modular architecture in pure Bash, this project demonstrates how traditional system administration tools can be enhanced with modern AI capabilities without complex dependencies or resource-heavy installations.
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
