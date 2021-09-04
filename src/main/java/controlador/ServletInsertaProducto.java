package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Producto;
import model.ModelProducto;

/**
 * Servlet implementation class ServletInsertaProducto
 */
@WebServlet("/insertaProducto")
public class ServletInsertaProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String nom = request.getParameter("nombre");
			String pre = request.getParameter("precio");
			String stk = request.getParameter("stock");
			
			Producto obj = new Producto();
			obj.setNombre(nom);
			obj.setPrecio(Double.parseDouble(pre));
			obj.setStock(Integer.parseInt(stk));
			
			ModelProducto model = new ModelProducto();
			int s = model.insertaProducto(obj);
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
			response.sendRedirect("registraProducto.jsp");
		}
		
		
	}

}
