#/bin/bash
echo "${TZ}" > /etc/timezone
cd /app/squoosh && npm run dev