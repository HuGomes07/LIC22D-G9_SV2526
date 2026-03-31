import isel.leic.UsbPort
import isel.leic.utils.Time
import kotlin.math.log2

fun main(args: Array<String>) {
    HAL.init()
/*
    LCD.writeCMD(0b11110000)
*/
    LCD.writeCMD(0b00110000)
    LCD.writeCMD(0b00110000)
    LCD.writeCMD(0b00110000)

    LCD.writeCMD(0b00110100)//+10==2  2 linhas N;
    LCD.writeCMD(0b00001000)
    LCD.writeCMD(0b00000001)
    LCD.writeCMD(0b00000110)
}

//masks:
    const val kMask =     0b00001111
    const val kValMask =  0b00010000

    const val LCDsel =    0b00000001
    const val sCLK =      0b00000010
    const val sdx =       0b00000100
//
object HAL{
    var outs = 0b00000000

    fun init(){
        clrBits(0b11111111)
    }
    fun writeBit(mask:Int, value: Int) {
        outs = (outs and mask.inv()) or (value and mask)
        UsbPort.write(outs)
    }
    fun isBit(value: Int): Boolean {
        outs = value and outs
        return (outs) != 0
    }
    fun readBit(mask:Int): Int{
        outs = mask and outs
        return (outs)
    }
    fun setBits(mask:Int) {
        outs = outs or mask
        UsbPort.write(outs)
    }
    fun clrBits(mask:Int) {
        outs = outs and mask.inv()
        UsbPort.write(outs)
    }
}

object KBD {
    const val NONE = 0;
    val matrix = arrayOf(
        arrayOf('1', '2', '3', 'A'),
        arrayOf('4', '5', '6', 'B'),
        arrayOf('7', '8', '9', 'C'),
        arrayOf('*', '0', '#', 'D')
    )

    fun init() {}

    fun getKey(): Char {
        val keyCol = HAL.readBit(0b00001100) shr 2
        val keyLin = HAL.readBit(0b00000011)
        val Kval = HAL.isBit(kValMask)
        return if(Kval) {
            matrix[keyLin][keyCol]
        } else NONE.digitToChar()
    }

    fun waitKey(timeout: Long): Char {
        val startTime = Time.getTimeInMillis()
        while(Time.getTimeInMillis() - startTime < timeout) {
            val key = getKey()
            if(key != NONE.digitToChar()) { return key }
        }
        return NONE.digitToChar()
    }
}

object SerialEmitter {
    enum class Peripheral {LCD, TICKET}

    fun init() {
    }
    fun send(addr: Peripheral, data: Int) {
        val sel = LCDsel

        val interval = 10L

        // Ensure idle state
        HAL.setBits(sel)
        HAL.clrBits(sCLK)

        // Start condition (falling edge)
        HAL.clrBits(sel)

        // Send exactly 10 bits (MSB first)
        for (i in 0.. 9) {
            val bit = (data shr i) and 1
/*
            println("Bit: $bit, i: $i")
*/
            if (bit == 1) HAL.setBits(sdx)
            else HAL.clrBits(sdx)

            Time.sleep(interval)

            // Clock pulse
            HAL.setBits(sCLK)
            Time.sleep(interval)
            HAL.clrBits(sCLK)
        }

        // End transmission
        HAL.setBits(sel)
    }
    /*fun isBusy(): Boolean {
        return false
    }*/
}

object LCD {
    const val LINES = 2
    const val COLS = 16
    fun writeByteSerial(rs: Boolean, data: Int) {
        val rsBit = if (rs) 1 else 0
        val notRsBit = if (rs) 0 else 1
        // Build frame: E (bit 9),  RS (bit 0), DATA (bits 8–1)
        val firstFrame = (1 shl 9) or (data shl 1) or rsBit
        val secondFrame = (0 shl 9) or (data shl 1) or rsBit

        SerialEmitter.send(SerialEmitter.Peripheral.LCD, firstFrame)
        SerialEmitter.send(SerialEmitter.Peripheral.LCD, secondFrame)
    }
    fun writeByte (rs: Boolean, data: Int) {
        writeByteSerial(rs, data)
        Time.sleep(2)
    }
    fun writeCMD (data : Int ) {
        writeByte(false, data)
    }
    fun writeDATA (data : Int ) {
        writeByte(true, data)
    }
    fun init() {
        Time.sleep(50)
        writeCMD(0x38) // 8-bit, 2 lines
        writeCMD(0x0C) // display ON
        writeCMD(0x01) // clear
        writeCMD(0x06) // entry mode
    }
    fun write (c : Char ) {
        writeDATA(c.code)
    }
    fun write (text : String ) {
        for (i in text){
            write(i)
        }
    }
    fun cursor(line: Int, column : Int ) {
        val address = if (line == 0) column else 0x40 + column
        writeCMD(0x80 or address)
    }
    fun clear() {
        writeCMD(0x01)
        Time.sleep(2)
    }
}
