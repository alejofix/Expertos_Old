<?php
	
	class Index extends Controlador {
		
		/**
		 * Index::__Construct()
		 * 
		 * Genera la vallidacion de los permisos de lectura
		 * @return void
		 */
		function __Construct() {
			parent::__Construct();
			AppSesion::validar('LECTURA');
		}
		
		/**
		 * Index::Index()
		 *
		 * genera la plantilla del chat correspondiente 
		 * @return string
		 */
		public function Index() {
			/*
			$sesion = AppSesion::obtenerDatos();
			
			$validar = new NeuralJQueryFormularioValidacion(true, true, false);
			$validar->requerido('mensaje', 'Debe Ingresar el Mensaje a Enviar');
			$validar->ControlEnvio('peticionAjaxFormGuardar("sms", "chat", "'.NeuralRutasApp::RutaUrlAppModulo('Chat', 'Mensaje', 'Enviar').'", "'.$sesion['Informacion']['USUARIO_RR'].'");');
		    
           	$plantilla = new NeuralPlantillasTwig(APP);
    		$plantilla->Parametro('Sesion', $sesion);
			$plantilla->Parametro('Script', $validar->Constructor('sms'));
			echo $plantilla->MostrarPlantilla(implode(DIRECTORY_SEPARATOR, array('Index', 'Index.html')));
			*/
			header("Location: ".NeuralRutasApp::RutaUrlAppModulo('Chat', 'Publico'));
			exit();
		}
	}