// Envia tramas para os diferentes modulos Serial Receiver.
object SerialEmitter {
    enum class Peripheral {LCD, TICKET}

    // Inicia a classe
    fun init() {}

    // Envia uma trama para o SerialReceiver identificado o periferico de destino em 'addr', os bits de dados em 'data' e em
    // 'size' o numero de bits a enviar.
    fun send(addr: Peripheral, data: Int) {
        val sel = LCDsel

        val interval = 1L

        HAL.setBits(sel)
        HAL.clrBits(sCLK)

        HAL.clrBits(sel)

        for (i in 0.. 9) {
            val bit = (data shr i) and 1

            if (bit == 1) HAL.setBits(sdx)
            else HAL.clrBits(sdx)

            Time.sleep(interval)

            HAL.setBits(sCLK)
            Time.sleep(interval)
            HAL.clrBits(sCLK)
        }

        // End transmission
        HAL.setBits(sel)
    }

}
