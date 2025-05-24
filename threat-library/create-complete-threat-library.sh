#!/bin/bash

BASE_DIR="./"

declare -A attacks

attacks["ai_ml_attacks"]="adversarial-training data-leakage gradient-leak membership-inference model-inversion model-stealing poisoning-attacks"
attacks["application_attacks"]="command-injection csrf directory-traversal host-header-injection lfi open-redirect rfi sql-injection xss"
attacks["classic_attacks"]="keylogger malware phishing ransomware rootkit spyware trojan worm"
attacks["cloud_attacks"]="account-hijack api-gateway-exploitation cloud-configuration-drift cloud-malware data-leakage insecure-apis insecure-integrations misconfigured-storage"
attacks["cryptographic_attacks"]="birthday-attack brute-force dictionary-attack known-plaintext-attack padding-oracle rainbow-table timing-attack weak-encryption"
attacks["modern_attacks"]="adversarial-input ai-manipulation data-poisoning deepfake hallucination-abuse jailbreak-attacks prompt-injection synthetic-data-poisoning"
attacks["network_attacks"]="arp-spoofing ddos dns-poisoning mitm port-scanning smurf-attack snmp-attacks spoofing"
attacks["physical_attacks"]="bios-password-hack device-theft evil-maid hardware-keylogger physical-keylogging shoulder-surfing social-engineering-access usb-drop-attack"

for category in "${!attacks[@]}"; do
    mkdir -p "$BASE_DIR/$category"
    echo "<?php
// Index file for $category attacks
echo \"<h1>$category Security Attacks</h1>\";
echo \"<ul>\";
" > "$BASE_DIR/$category/index.php"

    for attack in ${attacks[$category]}; do
        # Create individual attack file
        echo "<?php
// $attack attack description
echo \"<h2>$attack Attack</h2>\";
echo \"<p>This page explains the $attack attack type in cybersecurity.</p>\";
?>" > "$BASE_DIR/$category/$attack.php"

        # Add link to index.php
        echo "echo \"<li><a href='$attack.php'>$attack Attack</a></li>\";" >> "$BASE_DIR/$category/index.php"
    done

    # Close ul tag in index.php
    echo "echo \"</ul>\";" >> "$BASE_DIR/$category/index.php"
done

echo "Threat library files created successfully."
