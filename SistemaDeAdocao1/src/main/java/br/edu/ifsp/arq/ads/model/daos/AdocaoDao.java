package br.edu.ifsp.arq.ads.model.daos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import br.edu.ifsp.arq.ads.model.entities.Adocao;
import br.edu.ifsp.arq.ads.model.entities.Animal;
import br.edu.ifsp.arq.ads.model.entities.Especie;
import br.edu.ifsp.arq.ads.model.entities.Sexo;
import br.edu.ifsp.arq.ads.model.entities.User;
import br.edu.ifsp.arq.ads.utils.SearcherDataSource;

public class AdocaoDao {

	private DataSource dataSource;

	public AdocaoDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public Boolean save(Adocao adocao) {
		String sql = "insert into adocao (adocao_date, funcionario_id, animal_id, email) values(?,?,?,?)";
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setDate(1, Date.valueOf(adocao.getDate()));
			ps.setLong(2, adocao.getUser().getId());
			ps.setInt(3, adocao.getAnimal());
			ps.setString(4, adocao.getEmail());
			ps.executeUpdate();
			return true;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro ao inserir dados", sqlException);
		}
	}
	
	
	public List<Adocao> getAdocao() {
		String sql = "select * from adocao";
		List<Adocao> adocoes = new ArrayList();
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Adocao adocao = new Adocao();
					adocao.setId(rs.getLong(1));
					adocao.setDate(LocalDate.parse(rs.getDate(2).toString()));
					adocao.setAnimal(rs.getInt(3));
					adocao.setEmail(rs.getString(4));
					adocoes.add(adocao);
				}
			}
			return adocoes;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro durante a consulta", sqlException);
		}
	}
}
