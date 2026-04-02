// Ler teclas. Funcoes retornam '0'..'9','A'..'D','#','*' ou NONE.
object KBD {	
    const val NONE = 0;
    val matrix = arrayOf(
        arrayOf('1', '2', '3', 'A'),
        arrayOf('4', '5', '6', 'B'),
        arrayOf('7', '8', '9', 'C'),
        arrayOf('*', '0', '#', 'D')
    )
	
    // Inicia a classe
    fun init() {}

    // Retorna de imediato a tecla premida ou NONE se nao ha tecla premida.
    fun getKey(): Char {
        val keyCol = HAL.readBit(0b00001100) shr 2
        val keyLin = HAL.readBit(0b00000011)
        val Kval = HAL.isBit(kValMask)
        return if(Kval) {
            matrix[keyLin][keyCol]
        } else NONE.digitToChar()
    }
        
    // Retorna a tecla premida, caso ocorra antes do 'timeout' (em milissegundos), 
    // ou NONE caso contrario.
    fun waitKey(timeout: Long): Char {
        val startTime = Time.getTimeInMillis()
        while(Time.getTimeInMillis() - startTime < timeout) {
            val key = getKey()
            if(key != NONE.digitToChar()) { return key }
        }
        return NONE.digitToChar()
    }
    
}