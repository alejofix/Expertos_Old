<?php
	
	class Listado extends Controlador {
		
		/**
		 * Listado::__Construct()
		 * 
		 * Genera la validacion de la peticion ajax correspondiente y la lectura de datos
		 * @return void
		 */
		function __Construct() {
			parent::__Construct();
			AppSesion::validar('LECTURA');
			if(AppValidar::PeticionAjax() == false):
				header("Location: ".NeuralRutasApp::RutaUrlAppModulo('Chat'));
				exit();
			endif;
		}
		
		/**
		 * Listado::Index()
		 * 
		 * genera el proceso de redireccionamiento al chat 
		 * @return void
		 */
		public function Index() {
			header("Location: ".NeuralRutasApp::RutaUrlAppModulo('Chat'));
			exit();
		}
		
		/**
		 * Listado::listadoMensajes()
		 * 
		 * consulta el modelo e imprime el json correspondiente
		 * @return string
		 */
		public function listadoMensajes() {
			//echo json_encode($this->Modelo->consultarMensajes());
			echo json_encode($this->Modelo->consultarMensajeSala(trim($_POST['sala'])));
		}
	}