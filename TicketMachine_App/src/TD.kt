import isel.leic.utils.Time

fun main(){
    HAL.clrBits(TDsel)
    TicketDispenser.activatePrintingTicket(true, 2,2)
    HAL.setBits(TDsel)
}

object TicketDispenser {
    // Inicia a classe, estabelecendo os valores iniciais.
    val stations = arrayOf(
        "Já foste",
        "Olha o que eu digo",
        "Não havia necessidade",
        "Isto é só rir",
        "Calma jovem",
        "Que informação dramática",
        "É lidar",
        "Ai Jesus",
        "Tá tudo bem",
        "Só que não",
        "A vida custa",
        "Fica para a próxima",
        "Não me chateies",
        "É uma casa portuguesa com certeza",
        "Agora aguenta",
        "Tá quieto"
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