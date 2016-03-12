<?php
	
	class CausaRaiz_Analisis extends Controlador {
		
		/**
		 * Index::__Construct()
		 * 
		 * genera la validacion del permiso asignado para su visualizacion
		 * @return void
		 */
		function __Construct() {
			parent::__Construct();
			AppSesion::validar('LECTURA');
		}
		
		/**
		 * Index::Index()
		 * 
		 * genera la plantilla inicial
		 * @return void
		 */
		public function Index() {
			$Plantilla = new NeuralPlantillasTwig(APP);
			$Plantilla->Parametro('Sesion', AppSesion::obtenerDatos());
            $Plantilla->Parametro('Titulo', ('Mejoramiento'));
            $Plantilla->Parametro('activo', __CLASS__);
        //    $Plantilla->Parametro('Validacion', $Val->Constructor('FormCausaRaizAnalisis'));
            $Plantilla->Parametro('ListadoAnalistas', $this->Modelo->ListaCargoCausaRaiz());
            $Plantilla->Parametro('ListadoMarcaciones', $this->Modelo->ListaMarcaciones());
			echo $Plantilla->MostrarPlantilla(implode(DIRECTORY_SEPARATOR, array('CausaRaiz_Analisis', 'CausaRaiz_Analisis.html')));
            // Ayudas::print_r(AppSesion::obtenerDatos());

		}

	}