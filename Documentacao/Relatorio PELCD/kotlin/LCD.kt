// Escreve no LCD usando a interface a 8 bits.
object LCD {
    // Dimensao do display.
    const val LINES = 2
    const val COLS = 16
    
    // Escreve um byte de comando / dados no LCD em serie
    fun writeByteSerial(rs: Boolean, data: Int) {
        val rsBit = if (rs) 1 else 0
        val notRsBit = if (rs) 0 else 1
        
        val firstFrame = (1 shl 9) or (data shl 1) or rsBit
        val secondFrame = (0 shl 9) or (data shl 1) or rsBit

        SerialEmitter.send(SerialEmitter.Peripheral.LCD, firstFrame)
        SerialEmitter.send(SerialEmitter.Peripheral.LCD, secondFrame)
    }
    
    // Escreve um byte de comando / dados no LCD
    fun writeByte (rs: Boolean, data: Int) {
        writeByteSerial(rs, data)
        Time.sleep(2)
    }
    
    // Escreve um comando no LCD
    fun writeCMD (data : Int ) {
        writeByte(false, data)
    }

    // Escreve um dado no LCD
    fun writeDATA (data : Int ) {
        writeByte(true, data)
    }

    // Envia a sequencia de iniciacao para comunicacao a 8 bits.
    fun init() {
        LCD.clear()
        LCD.writeCMD(0b00110000)
        LCD.writeCMD(0b00110000)
        LCD.writeCMD(0b00110000)

        LCD.writeCMD(0b00111000)//+10==2  2 linhas N;
        LCD.writeCMD(0b00001000)
        LCD.writeCMD(0b00000001)
        LCD.writeCMD(0b00000110)
        LCD.writeCMD(0b00001111)
    }

    // Escreve um carater na posicao corrente.
    fun write (c : Char ) {
        writeDATA(c.code)
    }
    
    // Escreve uma string na posicao corrente.
    fun write (text : String ) {
        for (i in text){
            write(i)
        }
    }

    // Envia comando para posicionar cursor ('line': 0..LINES-1, 'column': 0..COLS-1)
    fun cursor(line: Int, column : Int ) {
        val address = if (line == 0) column else 0x40 + column
        writeCMD(0x80 or address)
    }

    // Envia comando para limpar o ecra e posicionar o cursor em (0,0)
    fun clear() {
        writeCMD(0x01)
    }
}
