# smart_notes
A lightweight AI-powered text summarization app that condenses long input into crisp summaries using models like GPT-4, Claude, and more via OpenRouter.

# 📝 SmartNotes – Text Summarization App with OpenRouter

SmartNotes is a simple Ruby on Rails application that lets users input lengthy text and receive AI-generated summaries using [OpenRouter.ai](https://openrouter.ai) as the backend LLM provider.

---

## 🚀 Features

- 🧠 AI-powered summarization via OpenRouter (e.g. `gpt-3.5-turbo`)
- 🔐 Secure API integration using environment variables
- 📋 User-friendly interface for submitting text
- 🛠 Debuggable and extensible service layer

---

## ⚙️ Tech Stack

- **Ruby on Rails** 7.2
- **Ruby** 3.2.2
- **PostgreSQL** (or your choice of DB)
- **OpenRouter API** for AI model access
- **dotenv-rails** for secrets management

---

## 🛠 Setup

### 1. Clone the repo

```bash
git clone https://github.com/your-username/smart_notes.git
cd smart_notes

