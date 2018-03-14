const Web3 = require('web3');
const Miner = require('./miner');

const print = console.log
const numberOfMiningCores = 4;
const passphrase = "pass";
//const peerAddress = 'http://eth.msamy.ga:8545';
const peerAddress = 'http://127.0.0.1:8545';

const web3 = new Web3();
web3.setProvider(new web3.providers.HttpProvider(peerAddress));
const miner = new Miner(web3);

// print("web3.version.node: ", web3.version.node)
// print("web3.version.network: ", web3.version.network)
// print("web3.version.ethereum: ", web3.version.ethereum)
// print("web3.eth.accounts: ", web3.eth.accounts)

function mine3alaKhafeif(duration) {
  duration = duration||10000;
  // print("Blocks Before:", web3.eth.blockNumber, " takes ", duration, " ms" )
  miner.start(numberOfMiningCores)
  setTimeout(()=>{
    miner.stop();
    // print("Blocks After:", web3.eth.blockNumber)
  },duration);
}

var getBalance = (account) => web3.eth.getBalance(account).toString(10);
var getAccountBalance = (account) => ({account, balance: getBalance(account)});
var getAccounts = () => web3.eth.accounts;
var getAllBalances = () => getAccounts().map(getAccountBalance);
var getCoinbase = () => getAccountBalance(web3.eth.coinbase);
var createAccount = (pass)=> web3.personal.newAccount(passphrase);

var createAccountsIfNeeded = ()=>{
  if (getAccounts().length>=3) return;
  Array(3).fill().map(_=>createAccount());
}
var fundAllAccounts = ()=>{
  web3.personal.unlockAccount(web3.eth.coinbase, passphrase, 30000)
  web3.eth.accounts.map(account=>{
    web3.eth.sendTransaction({from: web3.eth.coinbase, to: account, value: web3.toWei(3, "ether"),gas: 2000000});
  })
}

// App
createAccountsIfNeeded();
fundAllAccounts();
mine3alaKhafeif();
print(getAllBalances());