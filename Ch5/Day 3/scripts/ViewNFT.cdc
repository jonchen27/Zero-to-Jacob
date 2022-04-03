import CryptoPoops from 0x01
import NonFungibleToken from 0x02

pub fun main(address: Address, id: UInt64) {
  let publicCollection = getAccount(address).getCapability(/public/MyCryptoPoops)
              .borrow<&CryptoPoops.Collection{CryptoPoops.ICollectionPublic}>()
              ?? panic("The address does not have a Collection.")
  let ref = publicCollection.borrowAuthNFT(id: id)
  log(ref.name)
  log(ref.favouriteFood)
  log(ref.luckyNumber)
}