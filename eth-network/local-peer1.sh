export PEER=eth-peer-1
export PORT=30301
export RPC_PORT=8545
#rm -rf ${PEER}*

# geth --datadir ./${PEER} account new console
# geth --datadir ./${PEER} init ./genesis.json

geth --rpc \
    --rpccorsdomain "*" \
    --rpcapi db,eth,net,web3,personal,web3,miner,admin  \
    --rpcport ${RPC_PORT} \
    --datadir ./${PEER} \
    --nodiscover \
    --identity ${PEER} \
    --networkid 1114 \
    --port ${PORT} \
    #--verbosity 6 \
    #2>> /tmp/eth.log
    

# in another window run
# geth attaqch <ipcpath>

