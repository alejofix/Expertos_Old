<?php

 class Info_Modelo extends Modelo {
		
		private $Info = false;
				
		function __Construct() {
			parent::__Construct();
			$this->ConexionBD = NeuralConexionDB::DoctrineDBAL(APPBD);
		}
		
		public function consultaInfoUsuario($Usuario = false, $Password = false) {
			$Consulta = $this->ConexionBD->prepare('
				SELECT 
					USUARIOS.ID,
                    USUARIOS.NOMBRE,
					USUARIOS.USUARIO_RR,
					USUARIOS.CORREO,
                    USUARIOS.EMPRESA,
					USUARIOS.PASSWORD
				FROM 
					USUARIOS
			');
			$Consulta->bindValue(1, $Usuario);
			$Consulta->bindValue(2, sha1($Password));
			$Consulta->execute();
			$this->Info = $Consulta->fetch(PDO::FETCH_ASSOC);
			return $Consulta->rowCount();
		}
		
		public function obtenerDatos() {
			return (is_array($this->Info) == true) ? $this->Info : false;
		}
		
	}