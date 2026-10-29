#!/usr/bin/env bash
# Kurulumdan SONRA robotu rehberli çalıştırır:   bash calistir.sh
# (Her adımı anlatır, güvenlik sorar, sonucu kontrol eder, kaldığın yerden devam eder.)
cd "$(dirname "${BASH_SOURCE[0]}")/software" || exit 1
exec python3 calistir.py "$@"
