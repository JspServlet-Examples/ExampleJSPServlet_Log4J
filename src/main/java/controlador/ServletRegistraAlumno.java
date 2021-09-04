package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Alumno;
import model.ModelAlumno;

/**
 * Servlet implementation class ServletRegistraAlumno
 */
@WebServlet("/registraAlumno")
public class ServletRegistraAlumno extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			//1 Se recogen los valores de las cajas de texto
			//Todos los valores viene en formato String
			//Se obtiene con los nombres de las cajas de texto
			String nom = request.getParameter("nombre");
			String ape = request.getParameter("apellido");
			String eda = request.getParameter("edad");
			
			//2 Se crea el objeoto alumno
			Alumno obj = new Alumno();
			obj.setNombre(nom);
			obj.setApellido(ape);
			obj.setEdad(Integer.parseInt(eda));
			
			//3 Se inserta a la BD
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
			request.getSession().setAttribute("MENSAJE", 
					"Error en el registro");
		} finally{
			response.sendRedirect("registraAlumno.jsp");
		}
	}

}










