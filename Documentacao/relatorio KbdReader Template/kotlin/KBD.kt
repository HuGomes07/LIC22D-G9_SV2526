// Ler teclas. Funcoes retornam '0'..'9','A'..'D','#','*' ou NONE.
object KBD {	
const val NONE = 0;
	
// Inicia a classe
fun init()
{
}	 


// Retorna de imediato a tecla premida ou NONE se nao ha tecla premida.
fun getKey(): Char
{
}	 
	
// Retorna a tecla premida, caso ocorra antes do 'timeout' (em milissegundos), 
// ou NONE caso contrario.
fun waitKey(timeout: Long): Char
{
}	 

}
