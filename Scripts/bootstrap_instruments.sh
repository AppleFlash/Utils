#!/bin/bash

set -euo pipefail

export BASE_PATH=$1

echo "🦄 Install instruments... 🦄"
./$BASE_PATH/.setup_instruments.sh ./$BASE_PATH/.instruments.txt
