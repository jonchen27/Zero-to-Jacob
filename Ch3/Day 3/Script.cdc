import FavoriteNBAPlayer from 0x01

pub fun main(account: Address) {
    let player = FavoriteNBAPlayer.getReference(key: account)
    log(player)
}