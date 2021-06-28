<%-- 
    Document   : receberdadosregistro
    Created on : 27/06/2021, 18:28:05
    Author     : Izabela
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="dominio.Ponto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Controle de Ponto</title>
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
            img {
              display: block;
              margin-left: auto;
              margin-right: auto;
            }
            p{
                text-align: center;
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
            SimpleDateFormat formato = new SimpleDateFormat("HH:mm:ss");
                    
          //PEGAR OS PARAMETROS
	  String codigoempregado = request.getParameter("codigoempregado");
          String dataentrada = request.getParameter("dataentrada");
	  String horaentrada = request.getParameter("horaentrada");
	  String horaIntervalo = request.getParameter("horaintervalo");
	  String horaretorno = request.getParameter("horaretorno");
	  String horasaida = request.getParameter("horasaida");
	  String observacao = request.getParameter("observacao");
          
	  //INSTANCIAR         
          Ponto ponto = new Ponto();
          ponto.setCodigoempregado(Integer.parseInt(codigoempregado));
	  ponto.setDataentrada(Date.valueOf(dataentrada));
          ponto.setHoraentrada(Time.valueOf(horaentrada+ ":00"));
	  ponto.setHoraintervalo(Time.valueOf(horaIntervalo + ":00"));
          ponto.setHoraretorno(Time.valueOf(horaretorno + ":00"));
	  ponto.setHorasaida(Time.valueOf(horasaida + ":00"));
	  ponto.setObservacao(observacao);
        %>
            <div>
                <img src="IMAGENS/registro_ponto.jpg"  alt="imagem" />
                <p>
                    <%
                    if(ponto.registrar()){
                        out.write("PONTO REGISTRADO COM SUCESSO");
                    }
                    else
                    {
                        out.write("PROBLEMAS AO REGISTRAR, POR FAVOR REVISE SEUS DADOS");
                    }

                  %>
                </p>
            </div>
        </section>
    </body>
</html>

