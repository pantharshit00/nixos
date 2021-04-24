#!/usr/bin/env bash
set -euo pipefail

TEMP=$(hass-cli --output=json state get weather.home | jq .[].attributes.temperature)

echo "$TEMP°C"
