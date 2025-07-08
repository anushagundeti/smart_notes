require 'faraday'
require 'json'

class SummaryGenerator
  def self.call(text)
    url = "https://openrouter.ai/api/v1/chat/completions"
    debugger
    headers = {
      "Authorization" => "Bearer #{ENV['OPENROUTER_API_KEY']}",
      "Content-Type" => "application/json",
      "HTTP-Referer" => "http://localhost:3000", # REQUIRED
      "X-Title" => "Smart Notes Summarizer"       # REQUIRED
    }

    body = {
      model: "openai/gpt-3.5-turbo-0613", # Try Claude or Mixtral if needed
      messages: [
        { role: "system", content: "You summarize texts clearly." },
        { role: "user", content: "Summarize this:\n\n#{text}" }
      ],
      temperature: 0.3
    }

    response = Faraday.post(url, body.to_json, headers)
    debugger
    puts "📦 Raw status: #{response.status}"
    puts "📦 Raw body: #{response.body}"

    if response.status == 200
      parsed = JSON.parse(response.body)

      summary = parsed.dig("choices", 0, "message", "content")
      return summary.present? ? summary.strip : "Error: Summary was blank"
    else
      return "Error: OpenRouter returned status #{response.status}"
    end
  rescue JSON::ParserError => e
    return "Error: Failed to parse OpenRouter response: #{e.message}"
  rescue => e
    return "Error: Something went wrong: #{e.message}"
  end
end
