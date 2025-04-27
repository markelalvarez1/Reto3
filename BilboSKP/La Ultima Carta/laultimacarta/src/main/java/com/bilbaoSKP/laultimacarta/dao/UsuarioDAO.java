package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.bilbaoSKP.laultimacarta.dto.LoginUsuarioDTO;
import com.bilbaoSKP.laultimacarta.dto.UsuarioDTO;
import com.bilbaoSKP.laultimacarta.model.CentroEscolar;
import com.bilbaoSKP.laultimacarta.model.Cupon;
import com.bilbaoSKP.laultimacarta.model.Responsable;
import com.bilbaoSKP.laultimacarta.model.Rol;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.TipoSuscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.EstadoCuponEnum;
import com.bilbaoSKP.laultimacarta.model.enums.EstadoSuscripcionEnum;

public class UsuarioDAO {

	public boolean existeUsuario(UsuarioDTO usuarioDTO) {
		Connection con = AccesoBD.getConnection();
		ResultSet rs = null;
		PreparedStatement ps = null;

		try {
			String sql = "SELECT u.dni, u.correo " + "FROM usuario u " + "WHERE u.dni = ? OR u.correo = ?";

			ps = con.prepareStatement(sql);
			ps.setString(1, usuarioDTO.getDni());
			ps.setString(2, usuarioDTO.getCorreo());

			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			AccesoBD.closeConnection(rs, ps, null);
		}
		return false;
	}

	public int registrarUsuario(UsuarioDTO usuarioDTO, Connection conexion) {
		Connection con = conexion;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int id = 0;

		try {
			String sql = "INSERT INTO usuario (nombre, apellidos, dni, correo, contrasena, telefono, rol_id) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, usuarioDTO.getNombre());
			ps.setString(2, usuarioDTO.getApellidos());
			ps.setString(3, usuarioDTO.getDni());
			ps.setString(4, usuarioDTO.getCorreo());
			ps.setString(5, usuarioDTO.getContrasena());
			ps.setInt(6, Integer.parseInt(usuarioDTO.getTelefono()));
			ps.setInt(7, Integer.parseInt(usuarioDTO.getRolID()));

			ps.execute();
			rs = ps.getGeneratedKeys();
			if (rs.next()) {
				id = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			AccesoBD.closeConnection(rs, ps, null);
		}
		return id;
	}

	public Usuario getUsuario(LoginUsuarioDTO usuarioDTO) {
		Connection con = AccesoBD.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Usuario u = null;

		try {
			String sql = "SELECT u.id AS usuarioId, u.dni, u.nombre, u.apellidos, u.telefono, u.correo, r.tipo AS rol, r.id, s.id AS suscripcionId, s.fechaInicio, s.estado AS suscripcionEstado, s.suscripcion_tipo_id, s.codigoVerificacion, c.id AS cuponId, c.fechaCompra, c.fechaCaducidad, c.precio AS cuponPrecio, c.estado AS cuponEstado "
					+ "FROM usuario u " 
					+ "LEFT JOIN rol r ON u.rol_id = r.id "
					+ "LEFT JOIN suscripcion s ON s.usuario_id = u.id "
					+ "LEFT JOIN cupon c ON c.suscripcion_id = s.id AND c.estado IN ('DISPONIBLE', 'PROGRAMADO')"
					+ "WHERE u.correo = ? AND u.contrasena = ?";

			ps = con.prepareStatement(sql);
			ps.setString(1, usuarioDTO.getCorreo());
			ps.setString(2, usuarioDTO.getContrasena());
			rs = ps.executeQuery();
			while (rs.next()) {
				if (u == null) {
					 u = new Usuario();
		                u.setId(rs.getInt("usuarioId"));
		                u.setNombre(rs.getString("nombre"));

		                Rol rol = new Rol();
		                rol.setTipo(rs.getString("rol"));
		                rol.setId(rs.getInt("r.id"));
		                u.setRol(rol);

		                Suscripcion s = new Suscripcion();
		                s.setId(rs.getInt("suscripcionId"));
		                s.setFechaInicio(rs.getDate("fechaInicio").toLocalDate());
		                s.setEstado(EstadoSuscripcionEnum.fromString(rs.getString("suscripcionEstado")));

		                TipoSuscripcion ts = new TipoSuscripcion();
		                ts.setId(rs.getInt("suscripcion_tipo_id"));
		                s.setTipoSuscripcion(ts);
		                
		                s.setCupones(new ArrayList<Cupon>());
		                u.setSuscripcion(s);
				}
				Cupon c = new Cupon();
                c.setId(rs.getInt("cuponId"));
                c.setFechaCompra(rs.getDate("fechaCompra").toLocalDate());
                c.setFechaCaducidad(rs.getDate("fechaCaducidad").toLocalDate());
                c.setPrecio(rs.getDouble("cuponPrecio"));
                c.setEstadoCupon(EstadoCuponEnum.valueOf(rs.getString("cuponEstado")));
                
                u.getSuscripcion().getCupones().add(c);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			AccesoBD.closeConnection(rs, ps, con);
		}
		return u;
	}

	public Usuario getUsuarioByID(String idUsuario) {
	    Connection con = AccesoBD.getConnection();
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    Usuario u = null;
	    try {
	        String sql =
	            "SELECT "
	          + "  u.id               AS uid, "
	          + "  u.dni              AS udni, "
	          + "  u.nombre           AS unombre, "
	          + "  u.apellidos        AS uapellidos, "
	          + "  u.telefono         AS utelefono, "
	          + "  u.correo           AS ucorreo, "
	          + "  u.contrasena       AS ucontrasena, "
	          + "  u.rol_id           AS urol_id, "
	          + "  r.id               AS rid, "
	          + "  r.tipo             AS rtipo, "
	          + "  s.id               AS sid, "
	          + "  s.fechaInicio      AS sfechaInicio, "
	          + "  s.estado           AS sestado, "
	          + "  s.codigoVerificacion AS scodigo, "
	          + "  s.suscripcion_tipo_id AS sst_id, "
	          + "  st.id              AS stid, "
	          + "  st.tipo            AS sttipo, "
	          + "  st.precio          AS stprecio, "
	          + "  ce.id              AS ceid, "
	          + "  ce.cif             AS cecif, "
	          + "  ce.nombre          AS cenombre, "
	          + "  ce.correo          AS ce_correo, "
	          + "  ce.ciudad          AS ceciu, "
	          + "  ce.etapaEducativa  AS ceetapa, "
	          + "  ce.numeroAlumnos   AS cenum "
	          + "FROM usuario u "
	          + "LEFT JOIN rol r               ON u.rol_id              = r.id "
	          + "LEFT JOIN suscripcion s       ON s.usuario_id          = u.id "
	          + "LEFT JOIN suscripcionTipo st  ON s.suscripcion_tipo_id = st.id "
	          + "LEFT JOIN centroEscolar ce    ON ce.id_usuario         = u.id "
	          + "WHERE u.id = ?";
	        
	        ps = con.prepareStatement(sql);
	        ps.setString(1, idUsuario);
	        rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            // ¿Viene centro?
	            int ceid = rs.getInt("ceid");
	            boolean tieneCentro = !rs.wasNull();
	            // Instanciamos Usuario o Responsable
	            if (tieneCentro) {
	                Responsable resp = new Responsable();
	                // CentroEscolar
	                CentroEscolar centro = new CentroEscolar();
	                
	                centro.setId(ceid);
	                centro.setCIF(rs.getString("cecif"));
	                centro.setNombre(rs.getString("cenombre"));
	                centro.setCorreo(rs.getString("ce_correo"));
	                centro.setCiudad(rs.getString("ceciu"));
	                centro.setEtapaEducativa(rs.getString("ceetapa"));
	                centro.setNumeroAlumnos(rs.getInt("cenum"));
	                resp.setCentroEscolar(centro);
	                u = resp;
	            } else {
	                u = new Usuario();
	            }
	            
	            // Campos de Usuario
	            u.setId(rs.getInt("uid"));
	            u.setDni(rs.getString("udni"));
	            u.setNombre(rs.getString("unombre"));
	            u.setApellidos(rs.getString("uapellidos"));
	            u.setTelefono(rs.getInt("utelefono"));
	            u.setCorreo(rs.getString("ucorreo"));
	            u.setContrasena(rs.getString("ucontrasena"));
	            
	            // Rol
	            Rol rol = new Rol();
	            rol.setId(rs.getInt("rid"));
	            rol.setTipo(rs.getString("rtipo"));
	            u.setRol(rol);
	            
	            // Suscripción (si existe)
	            Integer sid = (Integer) rs.getObject("sid");
	            if (sid != null) {
	                Suscripcion sus = new Suscripcion();
	                sus.setId(sid);
	                sus.setFechaInicio(rs.getDate("sfechaInicio").toLocalDate());
	                sus.setEstado(EstadoSuscripcionEnum.fromString(rs.getString("sestado")));
	                sus.setCodigoAcceso(rs.getString("scodigo"));
	                // TipoSuscripcion
	                Integer stid = (Integer) rs.getObject("stid");
	                if (stid != null) {
	                    TipoSuscripcion tst = new TipoSuscripcion();
	                    tst.setId(stid);
	                    tst.setTipo(rs.getString("sttipo"));
	                    tst.setPrecio(rs.getDouble("stprecio"));
	                    sus.setTipoSuscripcion(tst);
	                }
	                u.setSuscripcion(sus);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        AccesoBD.closeConnection(rs, ps, con);
	    }
	    return u;
	}




	public ArrayList<Usuario> getAllUsuariosSinCentroEscolar() {
	    Connection con = AccesoBD.getConnection();
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    ArrayList<Usuario> listaUsuarios = new ArrayList<Usuario>();
	    try {
	        String sql = "SELECT "
	                + "u.id AS uid, u.dni, u.nombre, u.apellidos, u.telefono, u.correo, u.rol_id, "
	                + "s.id AS sid, s.fechaInicio, s.estado, "
	                + "r.id AS rid, r.tipo "
	                + "FROM usuario u "
	                + "LEFT JOIN suscripcion s ON s.usuario_id = u.id "
	                + "LEFT JOIN rol r ON u.rol_id = r.id "
	                + "LEFT JOIN centroEscolar ce ON ce.id_usuario = u.id "
	                + "WHERE ce.id_usuario IS NULL "
	                + "ORDER BY s.fechaInicio DESC";
	        
	        ps = con.prepareStatement(sql);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            Usuario usuario = new Usuario();
	            usuario.setId(rs.getInt("uid"));
	            usuario.setDni(rs.getString("dni"));
	            usuario.setNombre(rs.getString("nombre"));
	            usuario.setApellidos(rs.getString("apellidos"));
	            usuario.setTelefono(rs.getInt("telefono"));
	            usuario.setCorreo(rs.getString("correo"));

	            Rol rol = new Rol();
	            rol.setId(rs.getInt("rid"));
	            rol.setTipo(rs.getString("tipo"));
	            usuario.setRol(rol);

	            Suscripcion suscripcion = new Suscripcion();
	            suscripcion.setId(rs.getInt("sid"));
	            suscripcion.setFechaInicio(rs.getDate("fechaInicio").toLocalDate());
	            suscripcion.setEstado(EstadoSuscripcionEnum.fromString(rs.getString("estado")));
	           
	            usuario.setSuscripcion(suscripcion);

	            listaUsuarios.add(usuario);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        AccesoBD.closeConnection(rs, ps, con);
	    }
	    return listaUsuarios;
	}

	public ArrayList<Responsable> getAllUsuariosConCentroEscolar() {
	    Connection con = AccesoBD.getConnection();
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    ArrayList<Responsable> listaResponsables = new ArrayList<>();
	    try {
	        String sql = "SELECT "
	                + "u.id AS uid, u.dni, u.nombre, u.apellidos, u.telefono, u.correo, u.rol_id, "
	                + "s.id AS sid, s.fechaInicio, s.estado, "
	                + "r.id AS rid, r.tipo, "
	                + "ce.id AS ceid, ce.nombre AS cenombre, ce.correo, ce.ciudad, ce.etapaEducativa, ce.numeroAlumnos, ce.cif "
	                + "FROM usuario u "
	                + "LEFT JOIN suscripcion s ON s.usuario_id = u.id "
	                + "LEFT JOIN rol r ON u.rol_id = r.id "
	                + "INNER JOIN centroEscolar ce ON ce.id_usuario = u.id "
	                + "ORDER BY s.fechaInicio DESC";
	        
	        ps = con.prepareStatement(sql);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            Responsable responsable = new Responsable();
	            responsable.setId(rs.getInt("uid"));
	            responsable.setDni(rs.getString("dni"));
	            responsable.setNombre(rs.getString("nombre"));
	            responsable.setApellidos(rs.getString("apellidos"));
	            responsable.setTelefono(rs.getInt("telefono"));
	            responsable.setCorreo(rs.getString("correo"));

	            Rol rol = new Rol();
	            rol.setId(rs.getInt("rid"));
	            rol.setTipo(rs.getString("tipo"));
	            responsable.setRol(rol);

	            Suscripcion suscripcion = new Suscripcion();
	            suscripcion.setId(rs.getInt("sid"));
	            suscripcion.setFechaInicio(rs.getDate("fechaInicio").toLocalDate());
	            suscripcion.setEstado(EstadoSuscripcionEnum.fromString(rs.getString("estado")));
	           
	            responsable.setSuscripcion(suscripcion);

	            // Ahora el Centro Escolar
	            CentroEscolar centro = new CentroEscolar();
	            centro.setId(rs.getInt("ceid"));
	            centro.setNombre(rs.getString("cenombre"));
	            centro.setCiudad(rs.getString("ciudad"));
	            centro.setCorreo(rs.getString("ce.correo"));
	            centro.setEtapaEducativa(rs.getString("etapaEducativa"));
	            centro.setNumeroAlumnos(rs.getInt("numeroAlumnos"));
	            centro.setCIF(rs.getString("cif"));
	            responsable.setCentroEscolar(centro);

	            listaResponsables.add(responsable);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        AccesoBD.closeConnection(rs, ps, con);
	    }
	    return listaResponsables;
	}

	public Usuario getUsuarioBySuscripcionID(String idSuscripcion) {
		 Connection con = AccesoBD.getConnection();
		 PreparedStatement ps = null;
		 ResultSet rs = null;
		 Usuario u = null;
		 try {
			String sql = "SELECT u.* "
					+ "FROM usuario u "
					+ "INNER JOIN suscripcion s ON u.id = s.usuario_id  "
					+ "WHERE s.id = ?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, idSuscripcion);
			rs = ps.executeQuery();
			if(rs.next()) {
				u = new Usuario();
				u.setDni(rs.getString("dni"));
				u.setNombre(rs.getString("nombre"));
				u.setApellidos(rs.getString("apellidos"));
				u.setTelefono(rs.getInt("telefono"));
				u.setCorreo(rs.getString("correo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			AccesoBD.closeConnection(rs, ps, con);
		}
		 
		return u;
	}



}
