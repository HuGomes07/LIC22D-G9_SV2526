import isel.leic.utils.Time

fun main() {
    while (true){
        if (HAL.isBit(kValMask)){
            val k = KBD.getKey()
            println(k)
            HAL.setBits(k_ack)
            HAL.clrBits(k_ack)
        }
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