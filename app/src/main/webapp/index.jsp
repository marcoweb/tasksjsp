<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="java.util.Hashtable" %>

<%
    Hashtable tarefas;
    if(session.getAttribute("tarefas") instanceof Hashtable) {
        tarefas = (Hashtable) session.getAttribute("tarefas");
    } else {
        tarefas = new Hashtable<Integer, String>();
    }

    if(request.getMethod().equals("POST")) {
        tarefas.put(tarefas.size() + 1, request.getParameter("tarefa"));
    }
    
    session.setAttribute("tarefas", tarefas);
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Tarefas</title>
    </head>
    <body>
        <form action="index.jsp" method="post">
            <input type="text" name="tarefa" />
            <button type="submit">Salvar</button>
        </form>
        <hr />
        <ul>
            <c:forEach var="t" items="${tarefas}">
                <li>${t.value}</li>
            </c:forEach>
        </ul>
    </body>
</html>