import isel.leic.UsbPort

fun main(args: Array<String>) {
    while(true) {
        val value = UsbPort.read()
        UsbPort.write(value)
    }
}