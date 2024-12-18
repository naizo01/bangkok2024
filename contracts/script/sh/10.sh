# .envファイルを読み込む
if [ -f .env ]; then
  export $(cat .env | xargs)
else
  echo ".envファイルが見つかりません。"
  exit 1
fi

# forge scriptコマンドを実行
forge script script/Anvil.s.sol:CounterScript \
  --rpc-url $RPC_URL \
  --chain-id $CHAIN_ID \
  --private-key $PRIVATE_KEY \
  --broadcast \
  --verifier-url $SCAN_URL \
  --etherscan-api-key $SCAN_API_KEY \
  --priority-gas-price 10000000000 \
  -vvvv --via-ir