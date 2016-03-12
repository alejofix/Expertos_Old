<?php

 class Autentificacion_Modelo extends Modelo {
		
		private $Info = false;
				
		function __Construct() {
			parent::__Construct();
			$this->ConexionBD = NeuralConexionDB::DoctrineDBAL(APPBD);
		}
		
		public function consultaCantidadUsuario($Usuario = false, $Password = false) {
			$Consulta = $this->ConexionBD->prepare('
				SELECT 
					USUARIOS.NOMBRE,
					USUARIOS.USUARIO_RR,
					USUARIOS.CORREO,
					USUARIOS.PERMISO,
                    USUARIOS.EMPRESA, 
					USUARIOS.ESTADO
				FROM 
					USUARIOS 
				 
				WHERE 
					USUARIOS.USUARIO_RR = ? 
				AND 
					USUARIOS.PASSWORD = ?
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
		
		public function Permisos() {
			if(is_array($this->Info) == true) {
				$Consulta = $this->ConexionBD->prepare('
					SELECT
						PERMISOS_MODULOS.NOMBRE, 
						PERMISOS_BASE.LECTURA, 
						PERMISOS_BASE.ESCRITURA, 
						PERMISOS_BASE.ELIMINAR, 
						PERMISOS_BASE.ACTUALIZAR
					FROM 
						PERMISOS_SELECCION 
					INNER JOIN 
						PERMISOS_MODULOS 
					ON 
						PERMISOS_SELECCION.MODULOS_ID = PERMISOS_MODULOS.ID 
					INNER JOIN 
						PERMISOS_BASE 
					ON 
						PERMISOS_SELECCION.BASE_ID = PERMISOS_BASE.ID 
					WHERE 
						PERMISOS_SELECCION.NOMBRE_ID = ?
				');
				$Consulta->bindValue(1, $this->Info['PERMISO']);
				$Consulta->execute();
				return $Consulta->fetchAll(PDO::FETCH_ASSOC);
			}
			else {
				return false;
			}
		}
	}
   