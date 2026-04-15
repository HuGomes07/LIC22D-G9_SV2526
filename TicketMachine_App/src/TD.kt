import isel.leic.utils.Time

fun main(){
    HAL.clrBits(TDsel)
    TicketDispenser.activatePrintingTicket(true, 3,7)
    HAL.setBits(TDsel)
}

//fun main() {
//    HAL.init()
//
//    TicketDispenser.activatePrintingTicket(true, 3, 7)
//}

object TicketDispenser {
    // Inicia a classe, estabelecendo os valores iniciais.
    val stations = arrayOf(
        "Ja foste",
        "Olha o que eu digo",
        "Nao havia necessidade",
        "Isto e so rir",
        "Calma jovem",
        "Que informacao dramatica",
        "E lidar",
        "Ai Jesus",
        "Ta tudo bem",
        "So que nao",
        "A vida custa",
        "Fica para a próxima",
        "Nao me chateies",
        "Ta quieto"
    )

    fun init(){

    }
    // Envia comando para dispensar um bilhete
    fun activatePrintingTicket(roundTrip: Boolean, origin: Int, destination: Int){
        val rt = if (roundTrip) 1 else 0
        val prePrint = (0 shl 9) or (rt shl 8) or (origin shl 4) or destination
        val print = (1 shl 9) or (rt shl 8) or  (origin shl 4) or destination
        SerialEmitter.send(SerialEmitter.Peripheral.TICKET, prePrint)
        SerialEmitter.send(SerialEmitter.Peripheral.TICKET, print)
    }
}