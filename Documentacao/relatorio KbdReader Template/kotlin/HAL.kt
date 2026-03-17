object HAL { 	
// Inicia o objeto
fun init()
{
}

// Retorna 'true' se o bit definido pela mask esta com o valor logico '1' no UsbPort
fun isBit(mask: Int): Boolean
{
}

// Retorna os valores dos bits representados por mask presentes no UsbPort
fun readBits(mask: Int): Int
{
}
 

// Escreve nos bits representados por mask os valores dos bits correspondentes em value
fun writeBits(mask: Int, value: Int)
{
}

	
// Coloca os bits representados por mask no valor logico '1'
fun setBits(mask: Int)
{
}


// Coloca os bits representados por mask no valor logico '0'
fun clrBits(mask: Int)
{
}

}
