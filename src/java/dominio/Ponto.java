package dominio;

import java.sql.Date;
import java.sql.Time;
import utils.Conexao;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Ponto {
    private Integer id;
    private Integer codigoempregado;
    private String nomeempregado;
    private String turnoempregado;
    private Date dataentrada;
    private Time horaentrada;
    private Time horasaida;
    private Time horaintervalo;
    private Time horaretorno;
    private String observacao;
       
    //REGISTRAR PONTO
    public boolean registrar(){
        String sql = "insert into ponto(codigoempregado,dataentrada," +
                     "horaentrada,horaintervalo,horaretorno,horasaida, observacao)" +
                     "values(?,?,?,?,?,?,?)";
        Connection con = Conexao.conectar();
        try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setInt(1, this.codigoempregado);
           stm.setDate(2, this.dataentrada);
           stm.setTime(3, this.horaentrada);
           stm.setTime(4, this.horaintervalo);
           stm.setTime(5, this.horaretorno);
           stm.setTime(6, this.horasaida);
	   stm.setString(7, this.observacao);
           stm.execute();           
       } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
           return false;
       }        
       return true;
    }
    
    //CONSULTAR PELA DATA DE ENTRADA
    public List<Ponto> consultarData(String data1, String data2){
        List<Ponto> lista1 = new ArrayList<>();
        if ("".equals(data2)){
            data2 = data1;
        }
        Connection con = Conexao.conectar();
        
        String sql = "select p.codigoempregado, e.nomeempregado, e.turnoempregado," +
                      "p.dataentrada, p.horaentrada, p.horaintervalo," +
                      "p.horaretorno, p.horasaida, p.observacao " +
                      "from ponto p, empregados e, turno t " +
                      "where p.codigoempregado = e.codigoempregado and e.turnoempregado = t.turno " +
		      "and p.dataentrada between '"+ data1 +"' and '" + data2 +"' order by p.dataentrada";                    
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){             
                Ponto ponto = new Ponto();
                ponto.setCodigoempregado(rs.getInt("codigoempregado"));
                ponto.setNomeempregado(rs.getString("nomeempregado"));
                ponto.setTurnoempregado(rs.getString("turnoempregado"));
                ponto.setDataentrada(rs.getDate("dataentrada"));
                ponto.setHoraentrada(rs.getTime("horaentrada"));
                ponto.setHoraintervalo(rs.getTime("horaintervalo"));
                ponto.setHoraretorno(rs.getTime("horaretorno"));
                ponto.setHorasaida(rs.getTime("horasaida"));
                ponto.setObservacao(rs.getString("observacao"));
                lista1.add(ponto);
            }   
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }      
        return lista1;
    }  
    //CONSULTA TODOS OS PONTOS NO BANCO DE DADOS
    public List<Ponto> consultar(){
        List<Ponto> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select p.codigoempregado, e.nomeempregado, e.turnoempregado," +
                      "p.dataentrada, p.horaentrada, p.horaintervalo," +
                      "p.horaretorno, p.horasaida, p.observacao " +
                      "from ponto p, empregados e, turno t " +
                      "where p.codigoempregado = e.codigoempregado and e.turnoempregado = t.turno";                    
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){             
                Ponto ponto = new Ponto();
                ponto.setCodigoempregado(rs.getInt("codigoempregado"));
                ponto.setNomeempregado(rs.getString("nomeempregado"));
                ponto.setTurnoempregado(rs.getString("turnoempregado"));
                ponto.setDataentrada(rs.getDate("dataentrada"));
                ponto.setHoraentrada(rs.getTime("horaentrada"));
                ponto.setHoraintervalo(rs.getTime("horaintervalo"));
                ponto.setHoraretorno(rs.getTime("horaretorno"));
                ponto.setHorasaida(rs.getTime("horasaida"));
                ponto.setObservacao(rs.getString("observacao"));
                lista.add(ponto);
            }   
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }      
        return lista;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    } 
    
    public String getTurnoempregado() {
        return turnoempregado;
    }

    public void setTurnoempregado(String turnoempregado) {
        this.turnoempregado = turnoempregado;
    }
    
    
    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public String getNomeempregado() {
        return nomeempregado;
    }

    public void setNomeempregado(String nomeempregado) {
        this.nomeempregado = nomeempregado;
    }
        
    public Integer getCodigoempregado() {
        return codigoempregado;
    }

    public void setCodigoempregado(Integer codigoempregado) {
        this.codigoempregado = codigoempregado;
    }

    public Date getDataentrada() {
        return dataentrada;
    }

    public void setDataentrada(Date dataentrada) {
        this.dataentrada = dataentrada;
    }

    public Time getHoraentrada() {
        return horaentrada;
    }

    public void setHoraentrada(Time horaentrada) {
        this.horaentrada = horaentrada;
    }

    public Time getHorasaida() {
        return horasaida;
    }

    public void setHorasaida(Time horasaida) {
        this.horasaida = horasaida;
    }

    public Time getHoraintervalo() {
        return horaintervalo;
    }

    public void setHoraintervalo(Time horaintervalo) {
        this.horaintervalo = horaintervalo;
    }

    public Time getHoraretorno() {
        return horaretorno;
    }

    public void setHoraretorno(Time horaretorno) {
        this.horaretorno = horaretorno;
    }   

}
