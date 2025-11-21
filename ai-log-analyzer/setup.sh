#!/bin/bash
echo "🚀 Setting up AI Log Analyzer..."
echo "📝 Copying config template..."
cp config.sh.example config.sh
echo "🔧 Making scripts executable..."
chmod +x *.sh functions/*.sh
echo "📁 Creating directories..."
mkdir -p logs backups cache tests
echo "✅ Setup complete!"
echo "📋 Next steps:"
echo "1. Edit config.sh: nano config.sh"
echo "2. Set your email in ALERT_EMAIL"
echo "3. Set your Gemini API key: export GEMINI_API_KEY='your_key'"
echo "4. Test: ./analyzer.sh -a"
