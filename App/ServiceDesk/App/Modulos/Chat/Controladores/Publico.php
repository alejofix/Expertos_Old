<?php
	
	class Publico extends Controlador {
		
		function __Construct() {
			parent::__Construct();
			AppSesion::validar('LECTURA');
		}
		
		public function Index() {
			$sesion = AppSesion::obtenerDatos();
			
			$validar = new NeuralJQueryFormularioValidacion(true, true, false);
			$validar->requerido('mensaje', 'Debe Ingresar el Mensaje a Enviar');
			$validar->ControlEnvio('peticionAjaxFormGuardar("sms", "chat", "'.NeuralRutasApp::RutaUrlAppModulo('Chat', 'Mensaje', 'Enviar').'", "'.$sesion['Informacion']['USUARIO_RR'].'");');
		    
           	$plantilla = new NeuralPlantillasTwig(APP);
    		$plantilla->Parametro('Sesion', $sesion);
			$plantilla->Parametro('Script', $validar->Constructor('sms'));
			$plantilla->Parametro('salas', $this->Modelo->consultarSalas($sesion['Informacion']['USUARIO_RR']));
			echo $plantilla->MostrarPlantilla(implode(DIRECTORY_SEPARATOR, array('Index', 'Index.html')));
			//Ayudas::print_r($this->Modelo->consultarSalas($sesion['Informacion']['USUARIO_RR']));
		}
	}