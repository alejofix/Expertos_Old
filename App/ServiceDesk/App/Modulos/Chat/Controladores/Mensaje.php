<?php

   	class Mensaje extends Controlador {

		/**
		 * Mensaje::__Construct()
		 * 
		 * genera la validacion de permisos de escritura
		 * @return void
		 */
		function __Construct() {
			parent::__Construct();
			AppSesion::validar('ESCRITURA');
			if(AppValidar::PeticionAjax() == false):
				header("Location: ".NeuralRutasApp::RutaUrlAppModulo('Chat'));
				exit();
			endif;
		}
		
		/**
		 * Mensaje::Index()
		 * 
		 * Genera la redireccion al chat principal
		 * @return void
		 */
		public function Index() {
			header("Location: ".NeuralRutasApp::RutaUrlAppModulo('Chat'));
			exit();
		}
		
		/**
		 * Mensaje::Enviar()
		 * 
		 * Inicializa el proceso de envio del mensaje correspondiente
		 * @return void
		 */
		public function Enviar() {
			if(AppValidar::PeticionAjax() == true):
				$this->enviarExistencia();
			else:
				header("Location: ".NeuralRutasApp::RutaUrlAppModulo('Chat'));
				exit();
			endif;
		}
		
		/**
		 * Mensaje::enviarExistencia()
		 * 
		 * genera la validacion de la existencia de los datos post
		 * @return void
		 */
		private function enviarExistencia() {
			if(isset($_POST) == true):
				$this->enviarVacio();
			else:
				exit('No Hay Datos Post para procesar');
			endif;
		}
		
		/**
		 * Mensaje::enviarVacio()
		 * 
		 * valida que no existan datos post vacios
		 * @return void
		 */
		private function enviarVacio() {
			if(AppValidar::Vacio()->MatrizDatos($_POST) == true):
				$this->enviarFormato();
			else:
				exit('Formulario con Datos Vacios');
			endif;
		}
		
		/**
		 * Mensaje::enviarFormato()
		 * 
		 * genera el proceso de guardar los datos correspondientes
		 * y carga nuevamente los mensajes correspondientes
		 * @return void
		 */
		private function enviarFormato() {
			$DatosPost = AppFormato::Espacio()->MatrizDatos($_POST);
			$Mensaje = addslashes($DatosPost['mensaje']);
			$this->Modelo->guardar($Mensaje, $DatosPost['usuario'], $DatosPost['tipo']);
			echo json_encode($this->Modelo->listadoMensajes($DatosPost['tipo']));
		}
		
	}