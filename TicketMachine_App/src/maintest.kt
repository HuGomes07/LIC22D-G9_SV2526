import isel.leic.UsbPort
import isel.leic.utils.Time

//masks:
const val k_ack =       0b10000000
const val kMask =       0b00001111
const val kValMask =    0b00010000

const val LCDsel =      0b00000001
const val sCLK =        0b00000010
const val sdx =         0b00000100

fun main(args: Array<String>) {
    HAL.init()
    LCD.init()
//    LCD.writeCMD(0b01000000)
//    LCD.writeDATA(0b010101010)
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
        }
    }
}
