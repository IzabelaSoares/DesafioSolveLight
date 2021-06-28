package dominio;

import utils.Conexao;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Empregados {
    private Integer codigoempregado;
    private String nomeempregado;
    private String turnoempregado;  
    
    public Integer getCodigoempregado() {
        return codigoempregado;
    }

    public void setCodigoempregado(Integer codigoempregado) {
        this.codigoempregado = codigoempregado;
    }

    public String getNomeempregado() {
        return nomeempregado;
    }

    public void setNomeempregado(String nomeempregado) {
        this.nomeempregado = nomeempregado;
    }

    public String getTurnoempregado() {
        return turnoempregado;
    }

    public void setTurnoempregado(String turnoempregado) {
        this.turnoempregado = turnoempregado;
    }
    
    //LISTA DE OPÇÕES DE EMPREGADOS PARA REGISTRAR PONTO
    public List<Empregados> consultar(){
        List<Empregados> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select codigoempregado, nomeempregado, turnoempregado from empregados";
        try {
           PreparedStatement stm = con.prepareStatement(sql);
           ResultSet rs = stm.executeQuery(); 
           while(rs.next()){
             Empregados empregados = new Empregados();
             empregados.setCodigoempregado(rs.getInt("codigoempregado"));
             empregados.setNomeempregado(rs.getString("nomeempregado"));
             empregados.setTurnoempregado(rs.getString("turnoempregado"));
             lista.add(empregados);
           }    
        } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
        }      
        return lista;
    }    
}
