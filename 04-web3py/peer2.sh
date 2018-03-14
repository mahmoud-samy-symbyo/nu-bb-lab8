export PEER=eth-peer-2
export PORT=30302
export RPC_PORT=8546
#rm -rf ${PEER}*

geth --datadir ./${PEER} init ./genesis.json

geth --rpc \
    --rpccorsdomain "*" \
    --rpcapi db,eth,net,web3,personal,web3,miner  \
    --rpcport ${RPC_PORT} \
    --datadir ./${PEER} --nodiscover --identity ${PEER} --networkid 1114 --port ${PORT}  #2>> ${PEER}.log


# in another window run
# geth attaqch <ipcpath>
