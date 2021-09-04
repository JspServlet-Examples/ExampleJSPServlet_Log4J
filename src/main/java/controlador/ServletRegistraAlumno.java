package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import entidad.Alumno;
import model.ModelAlumno;

/**
 * Servlet implementation class ServletRegistraAlumno
 */
@WebServlet("/registraAlumno")
public class ServletRegistraAlumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(ServletRegistraAlumno.class.getName());

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BasicConfigurator.configure();
		try {
			//1 Se recogen los valores de las cajas de texto
			//Todos los valores viene en formato String
			//Se obtiene con los nombres de las cajas de texto
			LOGGER.info("1. Se leen los parámetros del request");
			String nom = request.getParameter("nombre");
			String ape = request.getParameter("apellido");
			String eda = request.getParameter("edad");
			
			//2 Se crea el objeoto alumno
			LOGGER.info("2. Se crea el objeto alumno");
			Alumno obj = new Alumno();
			obj.setNombre(nom);
			obj.setApellido(ape);
			obj.setEdad(Integer.parseInt(eda));
			
			//3 Se inserta a la BD
			LOGGER.info("3. Se inserta a la base de datos");
			ModelAlumno model = new ModelAlumno();
			int s = model.insertaAlumno(obj);
			if(s>0){
				request.getSession().setAttribute("MENSAJE", 
								"Se registró correctamente");
			}else{
				request.getSession().setAttribute("MENSAJE", 
							"Error en el registro");
			}
		} catch (Exception e) {
			LOGGER.error("Error: " + e);
			request.getSession().setAttribute("MENSAJE", 
					"Error en el registro");
		} finally{
			response.sendRedirect("registraAlumno.jsp");
		}
	}

}










