FROM python:3.11
WORKDIR /app

# Copy all source files
COPY . /app

# Make sure /app/agents/multi_tool_agent contains your agent config
RUN mkdir -p /app/agents && cp -r /app/multi_tool_agent /app/agents/multi_tool_agent

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

# Use $PORT for Cloud Run, fallback to 8080 for local
ENV PORT=8080
CMD ["sh", "-c", "uvicorn web_api:app --host 0.0.0.0 --port $PORT"]
