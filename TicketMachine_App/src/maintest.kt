import isel.leic.UsbPort
import isel.leic.utils.Time

//masks:
//IN
const val k_ack =           0b10000000
const val kMask =           0b00001111
const val kValMask =        0b00010000
const val printFinished =   0b00100000

//OUT
const val LCDsel =          0b00000001
const val sCLK =            0b00000010
const val sdx =             0b00000100
const val TDsel =           0b00001000

fun main(args: Array<String>) {
    HAL.init()
    LCD.init()
    var currCol = 0
    var currLine = 0
    while (true){
        if (HAL.isBit(kValMask)){
            Time.sleep(50)
            val k = KBD.getKey()
            LCD.write(k)
            println(k)
            currCol++
            HAL.setBits(k_ack)
            Time.sleep(100)
            HAL.clrBits(k_ack)
            if(currCol == LCD.COLS) {
                currCol = 0
                if(currLine++ < LCD.LINES) currLine++
                else currLine = 0
                LCD.cursor(currLine, currCol)
            }


            HAL.clrBits(TDsel)
            TicketDispenser.activatePrintingTicket(true, 2, 2)
            HAL.setBits(TDsel)
        }
    }
}