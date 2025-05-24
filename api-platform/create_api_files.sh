#!/bin/bash

base_dir="/data/data/com.termux/files/home/MUH-Nirob/api-platform"

declare -A folders_files=(
  ["blogger-google"]="blogger-api.php google-search-console-api.php google-indexing-api.php google-sheets-api.php google-calendar-api.php google-drive-api.php gmail-api.php google-docs-api.php google-translate-api.php google-analytics-api.php google-ads-api.php google-safe-browsing-api.php google-people-api.php google-cloud-vision-api.php google-places-api.php google-maps-api.php youtube-data-api.php google-tag-manager-api.php google-web-risk-api.php google-recaptcha-api.php"
  ["social-media"]="facebook-graph-api.php instagram-graph-api.php whatsapp-business-api.php telegram-bot-api.php twitter-api.php linkedin-api.php reddit-api.php pinterest-api.php discord-api.php viber-api.php signal-api.php tiktok-api.php facebook-messenger-api.php youtube-analytics-api.php snapchat-marketing-api.php tumblr-api.php line-api.php threads-api.php mastodon-api.php medium-api.php"
  ["ai-chatbot"]="openai-gpt-api.php claude-anthropic-api.php google-gemini-api.php mistral-api.php cohere-api.php huggingface-inference-api.php elevenlabs-api.php d-id-api.php replicate-api.php rasa-nlu-api.php botpress-api.php dialogflow-api.php voiceflow-api.php flowise-api.php langchain-api.php openrouter-api.php deepai-api.php assemblyai-api.php whisper-api.php deepgram-api.php"
  ["blogging-cms"]="wordpress-rest-api.php ghost-cms-api.php contentful-api.php strapi-api.php netlify-cms-api.php webflow-api.php notion-api.php hashnode-api.php devto-api.php sanity-api.php forestry-cms-api.php buttercms-api.php medium-api.php github-pages-api.php hugo-api.php nextjs-server-api.php docusaurus-api.php vercel-deployment-api.php render-api.php blogger-analytics-api.php"
  ["affiliate-cpa-ad-networks"]="amazon-associates-api.php fiverr-affiliate-api.php clickbank-api.php shareasale-api.php rakuten-api.php cj-affiliate-api.php partnerstack-api.php adsterra-api.php propellerads-api.php monetag-api.php awin-api.php mgid-api.php peerfly-api.php maxbounty-api.php cpagrip-api.php cpalead-api.php adworkmedia-api.php affiliaxe-api.php impact-radius-api.php smartlink-api.php"
  ["marketing-outreach"]="mailchimp-api.php sendinblue-api.php mailerlite-api.php convertkit-api.php getresponse-api.php emailoctopus-api.php klaviyo-api.php activecampaign-api.php moosend-api.php zoho-campaigns-api.php whatsapp-cloud-api.php sms-to-api.php twilio-api.php vonage-api.php telesign-api.php textmagic-api.php sendgrid-api.php amazon-ses-api.php sparkpost-api.php elasticemail-api.php"
  ["automation-crm"]="zapier-api.php integromat-api.php pabbly-connect-api.php n8n-api.php integrately-api.php bardeen-api.php tray-api.php ifttt-webhooks-api.php airtable-api.php notion-api.php trello-api.php clickup-api.php slack-api.php calendly-api.php typeform-api.php tally-api.php hubspot-api.php zoho-crm-api.php pipedrive-api.php monday-api.php"
  ["payment-security"]="stripe-api.php paypal-api.php razorpay-api.php payoneer-api.php wise-api.php coinbase-commerce-api.php blockchain-info-api.php ip-geolocation-api.php virustotal-api.php sucuri-api.php"
)

for folder in "${!folders_files[@]}"; do
  echo "Processing folder: $folder"
  dir_path="$base_dir/$folder"
  mkdir -p "$dir_path"

  # Create index.php with basic content
  index_file="$dir_path/index.php"
  echo "<?php" > "$index_file"
  echo "// Index file for $folder API platform" >> "$index_file"
  echo "?>" >> "$index_file"

  # Create all API files
  for file in ${folders_files[$folder]}; do
    file_path="$dir_path/$file"
    if [ ! -f "$file_path" ]; then
      echo "<?php" > "$file_path"
      echo "// API file: $file for $folder" >> "$file_path"
      echo "?>" >> "$file_path"
      echo "Created $file_path"
    else
      echo "$file_path already exists, skipping."
    fi
  done
done

echo "All files created successfully."
