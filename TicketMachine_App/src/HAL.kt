import isel.leic.UsbPort

fun main() {}

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
        val currBits = UsbPort.read()
        return (value and currBits) != 0
    }
    fun readBit(mask:Int): Int{
        val currBits = UsbPort.read()
        return (mask and currBits)
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