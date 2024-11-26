ff="$1"

if [ ! -f "$ff" ]; then
    echo "File not found!"
    exit 1
fi

jq '
    .stats = {} |
    .policy.levels."0".statsUserUplink = true |
    .policy.levels."0".statsUserDownlink = true |
    .policy.system.statsInboundUplink = false |
    .policy.system.statsInboundDownlink = false |
    .policy.system.statsOutboundUplink = true |
    .policy.system.statsOutboundDownlink = true |
    .api.services += ["StatsService", "LoggerService", "HandlerService"]
' "$ff" | sponge "$ff"

systemctl restart xray
