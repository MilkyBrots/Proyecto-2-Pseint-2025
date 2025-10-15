Proceso FACTURACION_TIQ_AEREOS
    // Septiembre 29= Inicializamos el proyecto, recordemos la importancia de las variables al igual que sus declaraciones, segun lo investigado del proyecto y conjunto a la UDM pagina 180, comenzaremos con la importancia del mismo:
    // Tomaremos primero las variables de entrada
    Definir nombrecliente Como Caracter;
    Definir cantidadtiquetes, destino, clase, temporada Como Entero;
    Definir continuar Como Caracter;
	
    // Ahora calcularemos las variables de cálculo por tiquete (reales)
    Definir costobase, incrementoclase, ajustetemporada, costotiquetesinimpuestos Como Real;
    Definir porcentajeajuste, porcentajeclase Como Entero;
	
    // Calcularemos los impuestos mediantes estas variables
    Definir ivaunitario, impseguridadunitario Como Real;
    Definir subtotal, ivatotal, imp_aero_total, impseguridaddtotal, totalapagar Como Real;
	
    // Y para finalizar las variables finales para dar el total 
    Definir totalclientes, totaltiquetes Como Entero;
    Definir acumMontosinimpuestos, acumIva, acumImpAero, acumImpSeguridad Como Real;
	
    // Usaremos estas variables para tipo texto
    Definir nombredestino, nombreclase, nombreetemporada Como Caracter;
	
    // 1 de Octubre= Ahora daremos por inicio las Inicializaciones del proyecto.
    totalclientes <- 0;
    totaltiquetes <- 0;
    acumMontosinimpuestos <- 0;
    acumIva <- 0;
    acumImpAero <- 0;
    acumImpSeguridad <- 0;
    continuar <- "S";
	
    Repetir
        Escribir "============================================================";
        Escribir "       Turismo en Masa Facturación de Tiquetes Aéreos      ";
        Escribir "============================================================";
		
        // Comenzaremos con el uso del comando Repetir segun el UDM 229 Estructura de repeticion de ciclos, bucles o loops - Nombre del cliente al igual que el If-Else UDM 215, tambien no olvidemos la estructura de repetir-hasta segun la 246 el cual se repite una serie de instrucciones al menos una vez, mientras se cumpla la condicion de mientras, segun UDM 236
        Repetir
            Escribir "Digite en nombre del cliente:";
            Leer nombrecliente;
            Si nombrecliente = "" Entonces
                Escribir "Error: El nombre no puede estar vacío. Por favor digite su nombre.";
            FinSi
        Hasta Que nombrecliente <> "";
		
        // Usaremos las variables dadas para la cantidad de tiquetes al igual nuevamente con el ciclo de repetir.
        Repetir
            Escribir "Digite la cantidad de tiquetes que van a comprar:";
            Leer cantidadtiquetes;
            Si cantidadtiquetes <= 0 Entonces
                Escribir "Error: La cantidad debe ser mayor a 0. Por favor intente de nuevo.";
            FinSi
        Hasta Que cantidadtiquetes > 0;
		
        // Daremos indicativos al cliente de los tipos de destino 
        Escribir "Digite el Tipo de Destino";
        Escribir " 1. Norteamerica";
        Escribir " 2. Sudamerica";
        Escribir " 3. Centro America";
        Escribir " 4. Oceania";
        Escribir " 5. Asia";
        Escribir " 6. Europa";
        Escribir " 7. Africa";
        Repetir
            Leer destino;
            Si (destino < 1) O (destino > 7) Entonces
                Escribir "Error: Destino inválido. Solo se aceptan valores del 1 al 7, según el tipo de tiquete que desee.";
            FinSi
        Hasta Que destino >= 1 Y destino <= 7;
		
        // Estructura SEGÚN para seleccionar el destino según número ingresado
        Segun destino Hacer
            1:
                costobase <- Aleatorio(300,700);
                nombredestino <- "Norteamerica";
            2:
                costobase <- Aleatorio(250,700);
                nombredestino <- "Sudamerica";
            3:
                costobase <- Aleatorio(150,450);
                nombredestino <- "Centro America";
            4:
                costobase <- Aleatorio(1000,1500);
                nombredestino <- "Oceania";
            5:
                costobase <- Aleatorio(1000,2500);
                nombredestino <- "Asia";
            6:
                costobase <- Aleatorio(800,1500);
                nombredestino <- "Europa";
            7:
                costobase <- Aleatorio(1000,2000);
                nombredestino <- "Africa";
        FinSegun
		
        // Ahora le haremos saber la seleccion de tiquetes de clase que pueda elegir
        Escribir "Digite la clase del tiquete";
        Escribir " 1. Primera Clase";
        Escribir " 2. Clase ejecutivo";
        Escribir " 3. Economica Premiun";
        Escribir " 4. Economica";
        Repetir
            Leer clase;
            Si (clase < 1) O (clase > 4) Entonces
                Escribir "Error: Clase inválida. Ingrese un número del 1 al 4 según la clase de tiquete que desea.";
            FinSi
        Hasta Que clase >= 1 Y clase <= 4;
		
        Segun clase Hacer
            1:
                porcentajeclase <- 150;
                nombreclase <- "Primera Clase  El tiquete aumentara un 150%";
            2:
                porcentajeclase <- 100;
                nombreclase <- "Clase Ejecutivo  El tiquete aumentara un 100%";
            3:
                porcentajeclase <- 40;
                nombreclase <- "Economica Premium  El tiquete aumentara un 40%";
            4:
                porcentajeclase <- 0;
                nombreclase <- "Economica  El tiquete no aumenta";
        FinSegun
		
        // 3 de Octubre, prosiguiendo con lo anterior, en el cual estabamos haciendo los procentajes de clase al igual qe dar a entender que segun la seleccion del tiquete se tomaria un porcentaje de aumento en el tiquete
        Escribir "Digite la tipo de temporada";
        Escribir " 1. Alta";
        Escribir " 2. Baja";
        Repetir
            Leer temporada;
            Si (temporada <> 1) Y (temporada <> 2) Entonces
                Escribir "Error: Temporada invalida. Por favor ingrese 1 para Alta o 2 para Baja.";
            FinSi
        Hasta Que temporada = 1 O temporada = 2;
		
        Si temporada = 1 Entonces
            porcentajeajuste <- Aleatorio(15,25);
            nombreetemporada <- "Alta. El tiquete aumenta un " + ConvertirATexto(porcentajeajuste) + "%";
            ajustetemporada <- (porcentajeajuste / 100) * costobase;
        Sino
            porcentajeajuste <- Aleatorio(0,10);
            nombreetemporada <- "Baja. El tiquete disminuye un " + ConvertirATexto(porcentajeajuste) + "%";
            ajustetemporada <- - (porcentajeajuste / 100) * costobase;
        FinSi
		
        // Haremos el calculo de los datos anteriormente brindados por el cliente
        incrementoclase <- (porcentajeclase / 100) * costobase;
        costotiquetesinimpuestos <- costobase + incrementoclase + ajustetemporada;
		
        ivaunitario <- costotiquetesinimpuestos * 0.13;
        impseguridadunitario <- costotiquetesinimpuestos * 0.01;
		
        subtotal <- costotiquetesinimpuestos * cantidadtiquetes;
        ivatotal <- ivaunitario * cantidadtiquetes;
        imp_aero_total <- 29 * cantidadtiquetes;
        impseguridaddtotal <- impseguridadunitario * cantidadtiquetes;
        totalapagar <- subtotal + ivatotal + imp_aero_total + impseguridaddtotal;
		
        // Y posterior daremos a escribir la interfaz que vera el usuario al momento de la facturacion 
        Escribir "----------------------------------------------------------------";
        Escribir "                           Turismo en Masa                      ";
        Escribir "                       Sistema de Facturación de Tiquetes      ";
        Escribir "----------------------------------------------------------------";
        Escribir "Nombre del cliente:       ", nombrecliente;
        Escribir "Cantidad de tiquetes comprados: ", cantidadtiquetes;
        Escribir "Viaja a:                  ", nombredestino;
        Escribir "Viaje en clase:           ", nombreclase;
        Escribir "Temporada en que viaja:   ", nombreetemporada;
        Escribir "----------------------------------------------------------------";
        Escribir "Costo del Tiquete antes impuestos";
        Escribir "  Costo Inicial del tiquete:      ", costobase;
        Escribir " + Costo por tipo clase:          ", incrementoclase;
        Escribir " + Costo de por tipo temporada:   ", ajustetemporada;
        Escribir "----------------------------------------------------------------";
        Escribir "Total tiquete antes Impuestos:    ", costotiquetesinimpuestos;
        Escribir "----------------------------------------------------------------";
        Escribir " Impuestos a cobrar: ";
        Escribir " + Aeroportuario:                 ", imp_aero_total;
        Escribir " + Seguridad aeroportuaria:       ", impseguridaddtotal;
        Escribir " + IVA:                          ", ivatotal;
        Escribir "----------------------------------------------------------------";
        Escribir " Total impuestos a cobrar:        ", (imp_aero_total + impseguridaddtotal + ivatotal);
        Escribir "----------------------------------------------------------------";
        Escribir " Monto total de la factura:       ", totalapagar;
        Escribir "----------------------------------------------------------------";
        Escribir "";
		
        // Ahora daremos la actualizacion de acumuladores de total de clientes, impuestos, iva, imp aero, etc etc....
        totalclientes <- totalclientes + 1;
        totaltiquetes <- totaltiquetes + cantidadtiquetes;
        acumMontosinimpuestos <- acumMontosinimpuestos + subtotal;
        acumIva <- acumIva + ivatotal;
        acumImpAero <- acumImpAero + imp_aero_total;
        acumImpSeguridad <- acumImpSeguridad + impseguridaddtotal;
		
        // 5 de Octubre Ahora le preguntaremos al cliente si es que desea otra factura.
        Repetir
            Escribir "¿Desea procesar otra factura? Por favor digite: S/s para Sí o N/n para No";
            Leer continuar;
            Si (continuar <> "S") Y (continuar <> "s") Y (continuar <> "N") Y (continuar <> "n") Entonces
                Escribir "Error: Por favor digite S (si) o N (no). Intente de nuevo.";
            FinSi
        Hasta Que (continuar = "S") O (continuar = "s") O (continuar = "N") O (continuar = "n");
		
    Hasta Que (continuar = "N") O (continuar = "n");
	
    // Daremos el reporte final.
    Escribir "";
    Escribir "==================== REPORTE FINAL DE VENTAS - TURISMO EN MASA ====================";
    Escribir "Cantidad de clientes:                ", totalclientes;
    Escribir "Cantidad total de tiquetes vendidos: ", totaltiquetes;
    Escribir "Monto acumulado de tiquetes vendidos (antes de impuestos): ", acumMontosinimpuestos;
    Escribir "Monto acumulado del IVA:            ", acumIva;
    Escribir "Monto acumulado del impuesto aeroportuario: ", acumImpAero;
    Escribir "Monto acumulado del impuesto de seguridad aeroportuaria: ", acumImpSeguridad;
    Escribir "================================================================";
	
	//Tuve que modificar el proyecto debido al error de redacción del PDF, según el anuncio dado el 9 de Octubre.
FinProceso
