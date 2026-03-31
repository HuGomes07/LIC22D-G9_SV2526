import isel.leic.utils.Time

fun main() {}

object SerialEmitter {
    enum class Peripheral {LCD, TICKET}

    fun init() {
    }
    fun send(addr: Peripheral, data: Int) {
        val sel = LCDsel

        val interval = 1L

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