import isel.leic.UsbPort
import isel.leic.utils.Time

//masks:
//IN
const val k_ack =           0b10000000
const val kMask =           0b00001111
const val kValMask =        0b00010000
const val printFinished =   0b00100000
const val isPlaceSet =      0b01000000

//OUT
const val LCDsel =          0b00000001
const val sCLK =            0b00000010
const val sdx =             0b00000100
const val TDsel =           0b00001000

fun main(args: Array<String>) {
    HAL.init()
    LCD.init()

    var destination: Int? = null
    var origin: Int? = null
    var lastKey: Char? = null
    var roundTrip = false
    while (true){
        if (HAL.isBit(kValMask)){
            Time.sleep(50)
            val k = KBD.getKey()
            if (k == '*'){
                if (origin == null) {
                    origin = lastKey.toString().hexToInt()
                    println("Origin Saved")
                }
                else {
                    println("Destination Saved")
                    destination = lastKey.toString().hexToInt()

                    /*ADD "round trip?"*/
                    TicketDispenser.activatePrintingTicket(
                        roundTrip,
                        origin,
                        destination,
                    )
                    LCD.clear()
                    LCD.write("Orig.:" +TicketDispenser.stations[origin.toString().hexToInt()] + " Dest.:" +TicketDispenser.stations[destination.toString().hexToInt()])
                }
            }else if(k == '#'){
                roundTrip= !roundTrip
                if (roundTrip){println("Round")}else
                println("One way")
            }else {
                LCD.clear()
                LCD.write(TicketDispenser.stations[k.toString().hexToInt()])
                println(TicketDispenser.stations[k.toString().hexToInt()])
            }
            lastKey = k
            HAL.setBits(k_ack)
            Time.sleep(100)
            HAL.clrBits(k_ack)


            /*if(!SerialEmitter.isBusy()) {
                *//*
                TicketDispenser.activatePrintingTicket(true, 2, 2)
*//*
                while (!HAL.isBit(isPlaceSet));
                val place1 = KBD.getKey()
                LCD.clear()
                LCD.write(TicketDispenser.stations[place1.toString().toInt()])
                println(place1)
                Time.sleep(1000)
                while (!HAL.isBit(isPlaceSet));
                val place2 = KBD.getKey()
                LCD.clear()
                LCD.write(TicketDispenser.stations[place2.toString().toInt()])
                println(place2)
                TicketDispenser.activatePrintingTicket(
                    false,
                    place1.toString().hexToInt(),
                    place2.toString().hexToInt()
                )

            }*/
        }
    }
}