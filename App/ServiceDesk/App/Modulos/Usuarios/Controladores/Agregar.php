<?php
	
	/**
	 * Controlador: Index
	 */
	class Agregar extends Controlador {
		
		/**
		 * Metodo: Constructor
		 */
		function __Construct() {
			parent::__Construct();
			AppSesion::validar('ESCRITURA');
		}
		
		/**
		 * Metodo: Index
		 */
		public function Index() {
			
		}
	}