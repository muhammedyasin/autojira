#!/bin/bash

# Jira REST API ile otomatik olarak issue oluşturan bash betiği

# Jira API bilgileri
JIRA_USERNAME="MAIL_ADRES"
JIRA_API_KEY="API_KEY_TOKE"
JIRA_URL="https://nirvana.atlassian.net/rest/api/2/issue/"

# JSON request dosyası
JSON_FILE="request.json"

# JSON request içeriği
echo '{
  "fields": {
    "project": {
      "key": "ID"
    },
    "summary": "Otomatik Jira Issue Oluşturma Denemeleri #3",
    "description": "Bu jira Rest API(v2) ile Otomatik olarak oluşturulmuştur. Lütfen dikkate almayınız..!",
    "issuetype": {
      "name": "Ask a question"
    }
  }
}' > $JSON_FILE

# Jira API'ye isteği gönder
curl --user $JIRA_USERNAME:$JIRA_API_KEY -d @$JSON_FILE -H 'Content-Type: application/json' $JIRA_URL

# Temizlik: JSON dosyasını sil
rm $JSON_FILE
