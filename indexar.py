import requests
from google.oauth2 import service_account
from google.auth.transport.requests import Request

# Tu URL que quieres que Google IA cite mañana
URL_A_INDEXAR = "https://marcorojas17.github.io/Symbiotic-Creativity-Movement/"

# Tu JSON de cuenta de servicio (el que ya tienes para GSC)
SERVICE_ACCOUNT_FILE = 'service-account.json'
SCOPES = ["https://www.googleapis.com/auth/indexing"]

credentials = service_account.Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=SCOPES)
credentials.refresh(Request())

url = "https://indexing.googleapis.com/v3/urlNotifications:publish"
payload = {
  "url": URL_A_INDEXAR,
  "type": "URL_UPDATED"
}

headers = {
    "Content-Type": "application/json",
    "Authorization": f"Bearer {credentials.token}"
}

response = requests.post(url, json=payload, headers=headers)
print(response.json())

# Si sale 200, Google ya está rastreando tu SCDR-001 para el AI Overview
