<?php
	
	class Int_Tel extends Controlador {
		
		function __Construct() {
			parent::__Construct();
			AppSesion::validar('LECTURA');
		}
		
		/**
		 * Int_Tel::Index()
		 * 
		 * Pnatilla formulario
		 * @return void
		 */
		public function Index() {
			
			$Val = new NeuralJQueryFormularioValidacion(true, true, false);
			$Val->Requerido('aviso', 'Debe Ingresar el Número del Aviso');
			$Val->Numero('aviso', 'El Aviso debe Ser Numérico');
			$Val->CantMaxCaracteres('aviso', 10, 'Debe ingresar aviso con 10 Números');
			$Val->Requerido('prioridad', 'Debe Seleccionar una Prioridad');
            $Val->Requerido('data', 'Debe Seleccionar la Afectación del Cablemodem');
            $Val->Requerido('sector', 'Seleccione lugar de afectación');
			$Val->ControlEnvio('peticionAjax("FormularioInt_Tel", "Respuesta", "'.NeuralRutasApp::RutaUrlAppModulo('HFC', 'Int_Tel', 'ajaxGuion').'");');
			
			$Plantilla = new NeuralPlantillasTwig(APP);
			$Plantilla->Parametro('activo', __CLASS__);
            $Plantilla->Parametro('Titulo', ('Regional'));
			$Plantilla->Parametro('Sesion', AppSesion::obtenerDatos());
			$Plantilla->Parametro('Validacion', $Val->Constructor('FormularioInt_Tel'));
			echo $Plantilla->MostrarPlantilla(implode(DIRECTORY_SEPARATOR, array('Int_Tel', 'Index.html')));
		}
		
		/**
		 * TvBi::ajaxGuion()
		 * 
		 * genera el proceso de la construccion del guion
		 * se genera la validacion de escritura para poder guardar
		 * @return void
		 */
		public function ajaxGuion() {
			AppSesion::validar('ESCRITURA');
			
			if(AppValidar::PeticionAjax() == true):
				$this->ajaxExistencia();
			else:
				header("Location: ".NeuralRutasApp::RutaUrlAppModulo('HFC', 'Play3'));
				exit();
			endif;
		}
		
		/**
		 * Int_Tel::ajaxExistencia()
		 * 
		 * Genera la validacion del envio de los datos post
		 * @return void
		 */
		private function ajaxExistencia() {
			if(isset($_POST) == true):
				$this->ajaxPost();
			else:
				exit('Mensaje de error no hay datos post');
			endif;
		}
		
		/**
		 * Int_Tel::ajaxPost()
		 * 
		 * Genera la validacion si hay algun dato vacio
		 * @return void
		 */
		private function ajaxPost() {
			if(AppValidar::Vacio()->MatrizDatos($_POST) == true):
				$this->ajaxFormato();
			else:
				exit('El formulario tiene campos vacios');
			endif;
		}
		
		/**
		 * Int_Tel::ajaxFormato()
		 * 
		 * Genera el formato a los datos post
		 * @return void
		 */
		private function ajaxFormato() {
			$DatosPost = AppFormato::Espacio()->MatrizDatos($_POST);
			$this->ajaxProcesar($DatosPost);
		}
		
		/**
		 * Int_Tel::AjaxProcesar()
		 * 
		 * genera el proceso de validacion y creacion del guion
		 * @param array $array
		 * @return string
		 */
		private function ajaxProcesar($array = false) {
			$Plantilla = new NeuralPlantillasTwig(APP);
			$Plantilla->Parametro('Datos', $array);
			echo $Plantilla->MostrarPlantilla(implode(DIRECTORY_SEPARATOR, array('Int_Tel', 'ajaxProcesar.html')));
		}
	}