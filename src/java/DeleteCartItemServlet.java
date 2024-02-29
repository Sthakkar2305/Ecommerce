import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteCartItemServlet")
public class DeleteCartItemServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String cartId = request.getParameter("cartid");
        // Delete the item from the database
        deleteCartItem(cartId);

        // Redirect the user back to the cart page or any other appropriate page
        response.sendRedirect("cart.jsp");
    }

    private void deleteCartItem(String cartId) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce", "root", "");

            // Prepare the delete statement
            String sql = "DELETE FROM addtocartcart WHERE cartid = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, cartId);

            // Execute the delete statement
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Log or handle the exception as needed
        } finally {
            // Close PreparedStatement and Connection
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Log or handle the exception as needed
            }
        }
    }
}
