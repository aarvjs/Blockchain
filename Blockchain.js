const crypto = require('crypto');
class Block{
    constructor(index, timestamp, data, previousHash = ''){
        this.index = index;
        this.timestamp = timestamp;
        this.data = data;
        this.previousHash = previousHash;
        this.hash = this.calculateHash();
    }
    calculateHash(){
        return crypto.createHash('sha256')
        .update(this.index + this.timestamp + JSON.stringify(this.data) + this.previousHash)
        .digest('hex');
    }
}
class Blockchain{
    constructor(){
        this.chain = [this.createGenesisBlock()];
    }
    createGenesisBlock(){
        return new Block(0, new Date().toISOString(),"Genesis Block","0");
    }
    getLatestBlock(){
        return this.chain[this.chain.length - 1];
    }

    addBlock(newBlock){
        newBlock.previousHash = this.getLatestBlock().hash;
        newBlock.hash = newBlock.calculateHash();
        this.chain.push(newBlock);
    }
}
let myBlockchain = new Blockchain();
myBlockchain.addBlock(new Block(1, new Date().toISOString(), { amount: 10 }));
myBlockchain.addBlock(new Block(2, new Date().toISOString(), { amount: 20 }));
myBlockchain.addBlock(new Block(3, new Date().toISOString(), { amount: 30 }));
console.log(JSON.stringify(myBlockchain, null, 4));
