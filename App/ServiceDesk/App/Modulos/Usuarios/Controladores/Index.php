<?php
	
	/**
	 * Controlador: Index
	 */
	class Index extends Controlador {
		
		/**
		 * Metodo: Constructor
		 */
		function __Construct() {
			parent::__Construct();
			AppSesion::validar('LECTURA');
		}
		
		/**
		 * Metodo: Index
		 */
		public function Index() {
			
		}
	}