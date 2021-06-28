<%-- 
    Document   : consultarponto
    Created on : 26/06/2021, 05:07:48
    Author     : Izabela
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dominio.Ponto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Consultar Ponto</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href= "style.css">
        <style media="screen" type="text/css">
            body{
                background-color: rgb(249, 250, 252);
                margin: 0;
                padding: 0;
            }
            div, input{
                margin: 10px;
                text-align: center;
            }
            th{
                border: 1px solid black;
                padding: 20px 10px;
                font-size: 10pt; 
            }
            td{
                
            }
            table{
                table-layout: fixed;
                text-align: center;
                border-collapse: collapse;
                margin: 0 auto;
            }
            a{
              text-decoration: none;
              color: black;
            }
            nav{
              display: table;
              top: 0px;
              margin: 0 auto;
              
            }
            ul{
              padding-top: 0;
              margin-top: 0;
            }
            li{
              background-color: rgb(249, 250, 252);
              text-transform: none;
              display: inline-block;
              float: left;
              position: relative;
              text-align: center;
              width: 300px;
              line-height: 100px;
              transition-duration: 0.5s;
              box-shadow: none;
              font-weight: bolder;
            }
            li:hover{
              background-color:rgba(88, 93, 189, 0.89);
            }         
        </style>
        <script type="text/javascript"></script>
    </head>
    <body>
      <header>
          <nav class="MenuNav">
            <ul class="Menu">
              <li class="Menu"><a href="registrarponto.jsp">REGISTRAR PONTO</a></li>
              <li class="Menu"><a href="consultarponto.jsp">CONSULTAR PONTO</a></li>
            </ul>
          </nav>
        </header>
        <section>    
            <%
                SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");

                Ponto ponto = new Ponto();
                List<Ponto> listaponto = ponto.consultar();
            %>
            <div>
                <form action="receberdadosconsulta.jsp" method="POST">
                    <label for="dataentrada">DATA INICIAL</label>
                    <input type="date" name="dataentrada"/>
                    <label for="datafinal">DATA FINAL</label>
                    <input type="date" name="datafinal"/>
                    <input type="submit" value="CONSULTAR"/>
                </form>
            </div>
            <table>
                <thead>
                  <th>NOME EMPREGADO</th>
                  <th>TURNO</th>
                  <th>DATA</th>
                  <th>HORA DE ENTRADA</th>
                  <th>HORA DE INTERVALO</th>
                  <th>HORA DE RETORNO</th>
                  <th>HORA DE SAIDA</th>
                  <th>OBSERVAÇÃO</th>
                </thead>
                <tbody>
                    <% for(Ponto p : listaponto) {%>
                        <tr>
                            <td><% out.write(String.valueOf(p.getNomeempregado())); %></td>
                            <td><% out.write(String.valueOf(p.getTurnoempregado())); %></td>
                            <td><% out.write(String.valueOf(formato.format(p.getDataentrada()))); %></td>
                            <td><% out.write(String.valueOf(p.getHoraentrada())); %></td>
                            <td><% out.write(String.valueOf(p.getHoraintervalo())); %></td>
                            <td><% out.write(String.valueOf(p.getHoraretorno())); %></td>
                            <td><% out.write(String.valueOf(p.getHorasaida())); %></td>
                            <td><% out.write(String.valueOf(p.getObservacao())); %></td>                        
                        </tr>
                    <%}%>
                </tbody>
            </table>      
        </section>
    </body>
</html>



