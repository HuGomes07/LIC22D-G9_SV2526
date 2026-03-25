import isel.leic.UsbPort
import isel.leic.utils.Time
import HAL
import KBD

fun main(args: Array<String>) {
    HAL.init()
    while (true) {
        val key = KBD.getKey()
        println(key)
    }
}

object HAL{
    fun init(){
        UsbPort.write(0b00000000)
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
        val Kval = HAL.isBit(0b00010000)
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

object LCD {
    const val LINES = 2
    const val COLS = 16
    fun writeByteSerial(rs: Boolean, data: Int) {}
    fun writeByte (rs: Boolean, data: Int) {}
    fun writeCMD (data : Int ) {}
    fun writeDATA (data : Int ) {}
    fun init() {}
    fun write (c : Char ) {}
    fun write (text : String ) {}
    fun cursor(line: Int, column : Int ) {}
    fun clear() {}
}

object SerialEmitter {
    enum class Peripheral {LCD, TICKET}
    fun init() {}
    fun send(addr : Peripheral , data : Int ) {}
    //fun isBusy(): Boolean {}
}