import isel.leic.utils.Time

fun main() {
    LCD.init()
    var currCol = 0
    var currLine = 0
    while (true){
        if (HAL.isBit(kValMask)){
            Time.sleep(50)
            val k = KBD.getKey()
            LCD.write(k)
            println(k)
            var code = currCol + currLine + 1
            println("Code is: ${code}")
            when(currCol) {

            }
            currCol++
            HAL.setBits(k_ack)
            while(HAL.isBit(kValMask));
            Time.sleep(100)
            HAL.clrBits(k_ack)
            if(currCol == LCD.COLS) {
                currCol = 0
                if(currLine++ < LCD.LINES) currLine++
                else {
                    currLine = 0
                    //LCD.writeCMD(0b00011000)
                }
                LCD.cursor(currLine, currCol)
            }
        }
    }
}

object LCD {
    var currCol = 0
    var currLine = 0
    const val LINES = 2
    const val COLS = 16
    fun writeByteSerial(rs: Boolean, data: Int) {
        val rsBit = if (rs) 1 else 0

        // Build frame: E (bit 9),  RS (bit 0), DATA (bits 8–1)
        val firstFrame = (1 shl 9) or (data shl 1) or rsBit
        val secondFrame = (0 shl 9) or (data shl 1) or rsBit

        SerialEmitter.send(SerialEmitter.Peripheral.LCD, firstFrame)
        SerialEmitter.send(SerialEmitter.Peripheral.LCD, secondFrame)
    }
    fun writeByte (rs: Boolean, data: Int) {
        writeByteSerial(rs, data)
        Time.sleep(2)
    }
    fun writeCMD (data : Int ) {
        writeByte(false, data)
    }
    fun writeDATA (data : Int ) {
        writeByte(true, data)
    }
    fun init() {
        clear()
        writeCMD(0b00110000)
        writeCMD(0b00110000)
        writeCMD(0b00110000)

        writeCMD(0b00111000)//+10==2  2 linhas N;
        writeCMD(0b00001000)
        writeCMD(0b00000001)
        writeCMD(0b00000110)
        writeCMD(0b00001100)//last 2 bits are for cursor _ blinking

        clear()
    }
    fun write (c : Char ) {
        if(currCol == LCD.COLS) {
            currCol = 0
            if(currLine++ < LCD.LINES) currLine++
            else currLine = 0
            cursor(currLine, currCol)
        }
        currCol++
        writeDATA(c.code)
    }
    fun write (text : String ) {
        for (i in text){
            write(i)
        }
    }
    fun cursor(line: Int, column : Int ) {
        val address = if (line == 0) column else 0x40 + column
        writeCMD(0x80 or address)

        currLine = line
        currCol = column
    }
    fun clear() {
        writeCMD(0x01)
        currCol=0
        currLine=0
    }
}