import CryptoPoops from 0x01

transaction (name:String, food:String, number: Int){

  prepare(acct: AuthAccount) {
    // Load Collection
    let collection= acct.borrow<&CryptoPoops.Collection>(from: /storage/cryptopoops) ?? panic("No Collection")
    let minter = acct.borrow<&CryptoPoops.Minter>(from: /storage/Minter) ?? panic("No minter found")
    let myNFT <- minter.createNFT(name:name, favouriteFood:food, luckyNumber:number)
    collection.deposit(token: <- myNFT)
    log(collection.getIDs())
  }

  execute {
  }
}