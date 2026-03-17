import isel.leic.UsbPort
import isel.leic.utils.Time

fun main(args: Array<String>) {
    while(true) {
        val value = UsbPort.read()
        println(value)
    }
    //dentro desta main estão so testes das funções

    val lED_MASK = 0b00000001
    Time.sleep(10000)
    HAL.setBits(lED_MASK)
    println("Setted bits")

//    HAL.clrBits(lED_MASK)      // turn LED off
//    Time.sleep(10000)
//    HAL.setBits(lED_MASK)      // turn LED on
//    println(HAL.isBit(lED_MASK))
//    Time.sleep(10000)
//
//    HAL.clrBits(lED_MASK)      // turn LED off
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
        return (value and currBits) == 1
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
