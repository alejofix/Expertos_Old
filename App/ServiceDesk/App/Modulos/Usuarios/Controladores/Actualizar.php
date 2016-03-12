<?php
	
	/**
	 * Controlador: Index
	 */
	class Actualizar extends Controlador {
		
		/**
		 * Metodo: Constructor
		 */
		function __Construct() {
			parent::__Construct();
			AppSesion::validar('ACTUALIZAR');
		}
		
		/**
		 * Metodo: Index
		 */
		public function Index() {
			
		}
	}