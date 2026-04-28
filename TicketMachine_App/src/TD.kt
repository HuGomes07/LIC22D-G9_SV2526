import isel.leic.utils.Time

//fun main(){
//    HAL.clrBits(TDsel)
//    TicketDispenser.activatePrintingTicket(true, 3,7)
//    HAL.setBits(TDsel)
//}

//fun main() {
//    HAL.init()
//
//    TicketDispenser.activatePrintingTicket(true, 3, 7)
//}

fun main() {
    HAL.init()
    LCD.init()

    val origin = 7
    val destination = 9
    val roundTrip = true

    TicketDispenser.activatePrintingTicket(roundTrip, origin, destination)
    TicketDispenser.printTicketLCD(origin, destination, roundTrip)
}

object TicketDispenser {
    // Inicia a classe, estabelecendo os valores iniciais.
    val stations = arrayOf(
        "Travanca",         // 0
        "Alfaiates",        // 1
        "Barrancos",        // 2
        "Cercal",           // 3
        "Alvaiazere",       // 4
        "Rio Tinto",        // 5
        "Murtosa",          // 6
        "Sernancelhe",      // 7
        "Almada",           // 8
        "Alfeizerao",       // 9
        "Olivenca",         // 10
        "Fundao",           // 11
        "Tabuaco",          // 12
        "Moledo"            // 13
    )

    fun init(){

    }
    // Envia comando para dispensar um bilhete
    fun activatePrintingTicket(roundTrip: Boolean, origin: Int, destination: Int){
        val rt = if (roundTrip) 1 else 0
        val prePrint = (0 shl 0) or (rt shl 9) or (origin shl 1) or (destination  shl 5)
        val print = (1 shl 0) or (rt shl 9) or  (origin shl 1) or (destination shl 5)
        println("rt(0)->origin(1-4)->destination(5-8)->prt(9)")
        println(print)

        SerialEmitter.send(SerialEmitter.Peripheral.TICKET, prePrint)
        SerialEmitter.send(SerialEmitter.Peripheral.TICKET, print)
    }

    fun printTicketLCD(origin: Int, destination: Int, roundTrip: Boolean) {
        //val type = if (roundTrip) "RT" else "OW"

        LCD.clear()
        Time.sleep(500)

        // linha de cima
        LCD.cursor(0, 0)
        LCD.write("o:${stations[origin]}")

        // linha de baixo
        LCD.cursor(1, 0)
        LCD.write("d:${stations[destination]}")
    }

}