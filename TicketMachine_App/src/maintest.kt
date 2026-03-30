import isel.leic.UsbPort
import isel.leic.utils.Time
import kotlin.math.log2

fun main(args: Array<String>) {
    HAL.init()
    Time.sleep(3000)
    SerialEmitter.send(SerialEmitter.Peripheral.LCD, 0b01001110)
}

//masks:
    const val kMask =     0b00001111
    const val kValMask =  0b00010000

    const val LCDsel =    0b00000001
    const val sCLK =      0b00000010
    const val sdx =       0b00000100
//
object HAL{
    fun init(){
        clrBits(0b11111111)
    }
    fun writeBit(mask:Int, value: Int) {
        val currBits =UsbPort.read()
        UsbPort.write((currBits and mask.inv()) or (value and mask))
    }
    fun isBit(value: Int): Boolean {
        val currBits = UsbPort.read()
        return (value and currBits) != 0
    }
    fun readBit(mask:Int): Int{
        val currBits = UsbPort.read()
        return (mask and currBits)
    }
    fun setBits(mask:Int) {
        val currBits = UsbPort.read()
        UsbPort.write(currBits or mask)
    }
    fun clrBits(mask:Int) {
        val currBits = UsbPort.read()
        UsbPort.write(currBits and mask.inv())
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
        Time.sleep(1000)

        send(Peripheral.LCD, 0b0000110000)
        Time.sleep(5)
        send(Peripheral.LCD, 0b0000110000)
        Time.sleep(1)
        send(Peripheral.LCD, 0b0000110000)

        send(Peripheral.LCD, 0b0000111000)  //0b000000100 => N  0=1line 1=2line F => 0b00001000 1:0 5x10dots:5x8
        send(Peripheral.LCD, 0b0000001000)
        send(Peripheral.LCD, 0b0000000001)
        send(Peripheral.LCD, 0b0000000110)

        send(Peripheral.LCD, 0b0000001111)

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
        for (i in 9 downTo 0) {
            val bit = (data shr i) and 1

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

        // Build frame: RS (bit 9), DATA (bits 8–1), E (bit 0)
        val frame = (rsBit shl 9) or (data shl 1) or 1

        SerialEmitter.send(SerialEmitter.Peripheral.LCD, frame)
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
