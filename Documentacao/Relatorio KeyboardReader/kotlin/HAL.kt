object HAL { 	
    var outs = 0b00000000
    // Inicia o objeto
    fun init(){
        clrBits(0b11111111)
    }

    // Retorna 'true' se o bit definido pela mask esta com o valor logico '1' no UsbPort
    fun isBit(value: Int): Boolean {
        val currBits = UsbPort.read()
        return (value and currBits) != 0
    }

    // Retorna os valores dos bits representados por mask presentes no UsbPort
    fun readBit(mask:Int): Int{
        val currBits = UsbPort.read()
        return (mask and currBits)
    }

    // Escreve nos bits representados por mask os valores dos bits correspondentes em value
    fun writeBit(mask:Int, value: Int) {
        outs = (outs and mask.inv()) or (value and mask)
        UsbPort.write(outs)
    }

    // Coloca os bits representados por mask no valor logico '1'
    fun setBits(mask:Int) {
        outs = outs or mask
        UsbPort.write(outs)
    }
    
    // Coloca os bits representados por mask no valor logico '0'
    fun clrBits(mask:Int) {
        outs = outs and mask.inv()
        UsbPort.write(outs)
    }
}
