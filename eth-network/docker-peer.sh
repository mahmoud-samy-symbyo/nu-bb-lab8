export PEER=eth-peer-1
export PORT=30301
export RPC_PORT=8545
#rm -rf ${PEER}*

docker run --rm -it --name ${PEER} -v /data:/data ethereum/client-go --datadir /data/${PEER}  account new console
docker run --rm -it --name ${PEER} -v /data:/data ethereum/client-go --datadir /data/${PEER} init /data/genesis.json

docker run --rm -it --name ${PEER} -p ${PORT}:${PORT} -p ${RPC_PORT}:${RPC_PORT} -v /data:/data ethereum/client-go \
    --rpc \
    --rpccorsdomain "*" \
    --rpcapi db,eth,net,web3,personal,web3,miner  \
    --rpcport ${RPC_PORT} \
    --rpcaddr 0.0.0.0 \
    --rpcvhosts=eth.msamy.ga \
    --datadir /data/${PEER} \
    --nodiscover \
    --identity ${PEER} \
    --networkid 1114 \
    --port ${PORT} \
    --verbosity 6 
    #2>> /tmp/eth.log
    
# in another window run
# geth attaqch <ipcpath>

