<%-- 
    Document   : mtien
    Created on : Mar 2, 2024, 6:04:57 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="addCart" method="post">
            <input class="quantity" min="0" name="quantity" value="1" type="number">
            <input class="pid" min="0" name="pid" value="Var1" >

            <button type="submit" class="btn btn-light btn-md mr-1 mb-2"><i class="fas fa-shopping-cart pr-2"></i>Add to
                cart</button>
        </form>

    </body>
</html>
