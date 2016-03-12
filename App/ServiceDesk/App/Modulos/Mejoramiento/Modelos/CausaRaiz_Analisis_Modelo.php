<?php
	
	/**
	 * Clase: Index_Modelo
	 */
	class CausaRaiz_Analisis_Modelo extends Modelo {
		
		/**
		 * Metodo: Constructor
		 */
		function __Construct() {
			parent::__Construct();
			$this->ConexionBD = NeuralConexionDB::DoctrineDBAL(APPBD);
		}
		
		/**
		 * Metodo: Lista de Cargo_Causa_Raiz (fix)
         * genera una lista de los expertos que analizan causa raiz
         *  @return array
		 */
		public function ListaCargoCausaRaiz() {
		  $Consulta = $this->ConexionBD->prepare('
				 SELECT 
                    usuarios.NOMBRE 
                FROM usuarios 
                    WHERE usuarios.CARGO <= 2 
                ORDER BY 
                    usuarios.NOMBRE
			');
			$Consulta->bindValue(1, 2);
			$Consulta->execute();
			return $Consulta->fetchAll(PDO::FETCH_ASSOC); 
		   	
		}
        /**
		 * Metodo: Listado Marcaciones (fix)
         * listado general de las marcacioes 
         *  @return array
		 */
		public function ListaMarcaciones() {
		  $Consulta = $this->ConexionBD->prepare('
				 SELECT 
                    lista_marcaciones.RAZON, 
                    lista_marcaciones.MARCACION 
                FROM 
                    lista_marcaciones 
                ORDER BY 
                    lista_marcaciones.RAZON
			');
			$Consulta->bindValue(1, 1);
			$Consulta->execute();
			return $Consulta->fetchAll(PDO::FETCH_ASSOC); 
		   	
		}
        
        
        
	}