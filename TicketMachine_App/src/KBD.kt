import isel.leic.utils.Time
var serialReceiver = 0b0000
fun main() {
    while (true){
        /*if (HAL.isBit(kValMask)){
            val k = KBD.getKey()
            println(k)
            HAL.setBits(k_ack)
            HAL.clrBits(k_ack)
        }*/
        if(!HAL.isBit(kValMask)){

            KBD.getKey()

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
        serialReceiver = 0b0000

        for (i in 0..6) {
            HAL.setBits(TXclk)
            Time.sleep(1)
            HAL.clrBits(TXclk)
            val bit = if(HAL.isBit(kValMask)) 1 else 0

            if(i in 1..4){
                serialReceiver += bit shl i-1
            }

            if (i==0 && bit!=1 || i==5 && bit!=0) {
                return NONE.digitToChar()
            }

        }
//        println("serialReceiver = ${serialReceiver.toString(2)}")  // <-- and this

        val keyCol = serialReceiver shr 2
        val keyLin = serialReceiver and 0b11
        return matrix[keyLin][keyCol]
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