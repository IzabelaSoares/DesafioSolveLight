<%-- 
    Document   : registrarponto
    Created on : 26/06/2021, 05:04:56
    Author     : Izabela
--%>

<%@page import="java.util.List"%>
<%@page import="dominio.Empregados"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrar Ponto</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href= "style.css">
        <style media="screen" type="text/css">
            body{
                background-color: rgb(249, 250, 252);
                margin: 0;
                padding: 0;
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
            label, input, select{
                margin: 10px;
                text-align: left;
            }
            form{
                text-align: center;
                padding: 20px;    
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
    <%
        Empregados empregados = new Empregados();
        List<Empregados> listaempregados = empregados.consultar();
    %>
    <form action="receberdadosregistro.jsp" method="POST">
           <div>  
                <label>SELECIONE SEU NOME E TURNO</label>
                 <select name="codigoempregado">
                     <% for(Empregados e: listaempregados){ %>
                        <option name="codigoempregado" value="<%out.write(""+e.getCodigoempregado());%>">
                            <% out.write(e.getNomeempregado() + " - " + e.getTurnoempregado()); %>
                        </option>
                     <%}%>
                 </select> 
                 <br/>
           	 <label>DATA DE ENTRADA</label>
                 <input type="date" name="dataentrada"/><br/>
                 <label>HORA DE ENTRADA</label>
                 <input type="time" name="horaentrada"/><br/>
                 <label>SAIDA DO INTERVALO</label>
                 <input type="time" name="horaintervalo"/><br/>
                 <label>RETORNO INTERVALO</label>
                 <input type="time" name="horaretorno"/><br/>
                 <label>HORA DE SAIDA</label>
                 <input type="time" name="horasaida"/><br/>
                 <label>OBSERVAÇÃO</label>
                 <input type="text" size="50" name="observacao"/><br/>
		 <input type="submit" value="SALVAR"/>
            </div>     
        </form>        
    </body>
</html>
