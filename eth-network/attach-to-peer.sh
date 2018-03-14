# geth attach ipc:/data/eth-peer-1/geth.ipc
# geth attach http://127.0.0.1:8545
# geth attach ipc:\\\\.\\pipe\\geth.ipc
# geth attach http://eth.msamy.ga:8545

docker run --rm -it -v /data:/data ethereum/client-go attach ipc:/data/eth-peer-1/geth.ipc