package dominio;

import java.sql.Date;
import utils.Conexao;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class Turno {
    private String turno;
    private Time horaentrada;
    private Time horasaida;
        
    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
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

        
    
}
