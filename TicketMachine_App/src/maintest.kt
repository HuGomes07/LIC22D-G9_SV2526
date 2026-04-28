import isel.leic.UsbPort
import isel.leic.utils.Time
import TicketDispenser.printTicketLCD
import kValMask

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
const val TXclk =           0b00010000

var roundTrip = false
var mainDestination: Int = 0
var mainOrigin: Int = 0
var askedYet = false
var started = false

fun main(args: Array<String>) {
    HAL.init()
    LCD.init()
    var destination: Int? = null
    var origin: Int? = null
    var lastKey: Char? = null
    var lastN = 0
    while (true){
        if (!HAL.isBit(kValMask)){
            Time.sleep(50) //isto ta aqui para q?
            val k = KBD.getKey()
            if(!started){
                LCD.clear()
                LCD.write("    "+TicketDispenser.stations[0.toString().hexToInt()])
                LCD.cursor(1,0)
                LCD.write(" ↑ ↓  money")
                println(TicketDispenser.stations[0.toString().hexToInt()])
                started = true
            }else
            if (k == '*' && lastKey != null){
                if (origin == null) {
                    origin = lastKey.toString().hexToInt()
                    mainOrigin = origin
                    println("Origin Saved")
                }
                else if(destination == null){
                    println("Destination Saved")
                    destination = lastKey.toString().hexToInt()
                    mainDestination = destination
                    LCD.clear()
                    LCD.write("Round Trip? Press #, confirm *")
                    askedYet = true
                }else if(askedYet){
                    printTicketLCD(mainOrigin.toString().hexToInt(),mainDestination.toString().hexToInt(), roundTrip)
                    TicketDispenser.activatePrintingTicket(
                        roundTrip,
                        mainOrigin,
                        mainDestination,
                    )
                }
            }else if(k == '#'){
                roundTrip = !roundTrip
                if(roundTrip)println("Round Trip")else println("One way")
            }else if(k == 'A'){
                lastN++
                if (lastN == 14) lastN = 0
                LCD.clear()
                LCD.write(TicketDispenser.stations[lastN])
                println(TicketDispenser.stations[lastN])
            }else if(k == 'B'){
                lastN--
                if(lastN == -1) lastN = 13
                LCD.clear()
                LCD.write(TicketDispenser.stations[lastN])
                println(TicketDispenser.stations[lastN])
            }else{
                LCD.clear()
                LCD.write(TicketDispenser.stations[k.toString().hexToInt()])
                println(TicketDispenser.stations[k.toString().hexToInt()])
                lastN = k.toString().toInt()
            }
            lastKey = k
            HAL.setBits(k_ack)
            Time.sleep(100)
            HAL.clrBits(k_ack)
        }
    }
}
