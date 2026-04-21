import isel.leic.utils.Time

fun main() {}

object SerialEmitter {
    enum class Peripheral {LCD, TICKET}
/*
    var lastTDmsg = 0
*/
    fun init() {
    }
    fun send(addr: Peripheral, data: Int) {
        val sel = if(addr== Peripheral.TICKET) TDsel else LCDsel
        /*if(addr== Peripheral.TICKET){
            lastTDmsg = data shr 9
        }*/
        //val interval = 1L

        HAL.setBits(sel)
        HAL.clrBits(sCLK)

        // Start condition (falling edge)
        HAL.clrBits(sel)

        // Send exactly 10 bits (MSB first)
        for (i in 0 .. 9) {
            val bit = (data shr i) and 1

            if (bit == 1) HAL.setBits(sdx)
            else HAL.clrBits(sdx)

            // Clock pulse
            HAL.setBits(sCLK)

            HAL.clrBits(sCLK)
        }

        HAL.setBits(sel)
    }
    fun isBusy(): Boolean {
        TODO()
    }
}