package br.edu.ifsp.arq.ads.model.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import br.edu.ifsp.arq.ads.model.daos.filters.AnimalFilter;
import br.edu.ifsp.arq.ads.model.dto.AnimalByRaca;
import br.edu.ifsp.arq.ads.model.entities.Animal;
import br.edu.ifsp.arq.ads.model.entities.Especie;
import br.edu.ifsp.arq.ads.model.entities.Sexo;
import br.edu.ifsp.arq.ads.model.entities.User;

public class AnimalDao {

	private DataSource dataSource;

	public AnimalDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public Boolean save(Animal animal) {
		String sql = "insert into animal (nome, foto, especie, idade, sexo, raca, pelagem, problemas_saude, adotado) values(?,?,?,?,?,?,?,?,0)";
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, animal.getNome());
			ps.setString(2, animal.getFoto());
			ps.setString(3, animal.getEspecie().toString());
			ps.setInt(4, animal.getIdade());
			ps.setString(5, animal.getSexo().toString());
			ps.setString(6, animal.getRaca());
			ps.setString(7, animal.getPelagem());
			ps.setString(8, animal.getProblemas_saude());
			ps.executeUpdate();
			return true;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro ao inserir dados", sqlException);
		}
	}
	
	public List<Animal> getAnimal() {
		String sql = "select * from animal where adotado = 0";
		List<Animal> animals = new ArrayList();
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Animal animal = new Animal();
					animal.setId(rs.getLong(1));
					animal.setNome(rs.getString(2));
					animal.setFoto(rs.getString(3));
					animal.setEspecie(Especie.valueOf(rs.getString(4)));
					animal.setIdade(rs.getInt(5));
					animal.setSexo(Sexo.valueOf(rs.getString(6)));
					animal.setRaca(rs.getString(7));
					animal.setPelagem(rs.getNString(8));
					animal.setProblemas_saude(rs.getString(9));
					animals.add(animal);
				}
			}
			
			return animals;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro durante a consulta", sqlException);
		}
		
		
	}
	
	public Animal getAnimalsById(Long id) {
		String sql = "select * from animal where id=?";
		Animal animal = null;
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setLong(1, id);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					animal = new Animal();
					animal.setId(rs.getLong(1));
					animal.setNome(rs.getString(2));
					animal.setFoto(rs.getString(3));
					animal.setEspecie(Especie.valueOf(rs.getString(4)));
					animal.setIdade(rs.getInt(5));
					animal.setSexo(Sexo.valueOf(rs.getString(6)));
					animal.setRaca(rs.getString(7));
					animal.setPelagem(rs.getString(8));
					animal.setProblemas_saude(rs.getString(9));
				}
			}
			return animal;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro durante a consulta", sqlException);
		}
	}
	
	public Boolean update(Animal animal) {
		String sql = "update animal set " +
				"nome=?," +
				"foto=?," +
                "especie=?," +
                "idade=?," +
                "sexo=?," +
                "raca=?," +
                "pelagem=?," +
                "problemas_saude=?" +
                " where id=?";
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, animal.getNome());
			ps.setString(2, animal.getFoto());
			ps.setString(3, animal.getEspecie().toString());
			ps.setInt(4, animal.getIdade());
			ps.setString(5, animal.getSexo().toString());
			ps.setString(6, animal.getRaca());
			ps.setString(7, animal.getPelagem());
			ps.setString(8, animal.getProblemas_saude());
			ps.setLong(9, animal.getId());
			ps.executeUpdate();
			return true;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro ao atualizar dados", sqlException);
		}
	}
	
	public void updateList(int animal) {
		String sql = "update animal set adotado=1 where id=?";
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, animal);
			ps.executeUpdate();
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro ao atualizar dados", sqlException);
		}
	}
	
	public Boolean delete(Animal activity) {
		String sql = "delete from animal where id=?";
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setLong(1, activity.getId());
			ps.executeUpdate();
			return true;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro ao remover dados", sqlException);
		}
	}
	
	public List<Animal> getAnimalsByFilter(AnimalFilter filter) throws SQLException {
		StringBuilder sql = new StringBuilder("select * from animal where adotado = 0");
		List<Object> params = new ArrayList<>();
		
		if (filter.getEspecie() != null) {
			sql.append(" and especie=?");
			params.add(filter.getEspecie().getType().toString());
		}
		
		return getAnimalList(sql.toString(), params, filter.getUser());	
	}

	private List<Animal> getAnimalList(String sql, List<Object> params, User user) throws SQLException {
		List<Animal> animals = new ArrayList<>();
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			for (int i = 0; i < params.size(); i++) {
				ps.setObject(i+1, params.get(i));
			}
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Animal animal = new Animal();
					animal.setId(rs.getLong(1));
					animal.setNome(rs.getString(2));
					animal.setFoto(rs.getString(3));
					animal.setEspecie(Especie.valueOf(rs.getString(4)));
					animal.setIdade(rs.getInt(5));
					animal.setSexo(Sexo.valueOf(rs.getString(6)));
					animal.setRaca(rs.getString(7));
					animal.setPelagem(rs.getString(8));
					animal.setProblemas_saude(rs.getString(9));
					animals.add(animal);
				}
			}
		}
		return animals;
	}
	
	public List<AnimalByRaca> getAnimalsStatisticsByRaca() {
		String sql = "select raca, count(*) as animal_count from animal group by raca";
		List<AnimalByRaca> animals = new ArrayList<>();
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					AnimalByRaca animalByRaca = new AnimalByRaca();
					animalByRaca.setRaca(rs.getString(1));
					animalByRaca.setCount(rs.getInt(2));
					animals.add(animalByRaca);
				}
			}
			return animals;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro durante a consulta", sqlException);
		}
	}

}