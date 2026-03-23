import isel.leic.UsbPort
import isel.leic.utils.Time

fun main(args: Array<String>) {
//    while(true) {
//        val value = UsbPort.read()
//        println(value)
//    }
    //dentro desta main estão so testes das funções
    HAL.clrBits(0xFF)
    val lED_MASK = 0b00000001
    Time.sleep(10000)
    HAL.setBits(lED_MASK)
//    HAL.clrBits(lED_MASK)      // turn LED off
//    Time.sleep(10000)
//    HAL.setBits(lED_MASK)      // turn LED on
//    println(HAL.isBit(lED_MASK))
//    Time.sleep(10000)
//
//    HAL.clrBits(lED_MASK)      // turn LED off
    val key = KBD.waitKey(5000)
    println(key)
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
    val matrix = listOf(
        listOf('1', '2', '3', 'A'),
        listOf('4', '5', '6', 'B'),
        listOf('7', '8', '9', 'C'),
        listOf('*', '0', '#', 'D')
    )

    fun init() {}

    fun getKey(): Char {
        val keyCol = HAL.readBit(0b00001100) / 4
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