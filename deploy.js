const HDWalletPrrovider = require('@truffle/hdwallet-provider');
const Web3 = require('web3');
const {interface, bytecode} = require('./compile');
// const provider = new HDWalletPrrovider()


const provider = new HDWalletPrrovider(
    'task caution bus maple join slush helmet hotel friend walnut airport surprise',
    'https://rinkeby.infura.io/v3/8a4f303cda62468799d6899ec5645dc6',
    );

const web3 = new Web3(provider);

const deploy = async () => {
    const accounts = await web3.eth.getAccounts();
    console.log('Attempting to deploy from account' , accounts[0]);

    const result = await new web3.eth.Contract(JSON.parse(interface))
        .deploy({data:bytecode})
        .send({gas : '1000000' , from : accounts[0]});

    console.log(interface);    

    console.log('Contract deployed to', result.options.address);


    provider.engine.stop(); 
};
deploy();
