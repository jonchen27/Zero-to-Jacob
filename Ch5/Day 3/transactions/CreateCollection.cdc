import CryptoPoops from 0x01
import NonFungibleToken from 0x02

transaction {

  prepare(acct: AuthAccount) {
    // Create Collection
    acct.save(<- CryptoPoops.createEmptyCollection(), to: /storage/cryptopoops)

    acct.link<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic, CryptoPoops.ICollectionPublic}>(/public/MyCryptoPoops, target: /storage/cryptopoops)
  }

  execute {
    log("Collection created")
  }
}
