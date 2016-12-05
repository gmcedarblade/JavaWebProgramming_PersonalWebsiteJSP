package edu.cvtc.web.dao;

import java.sql.SQLException;
import java.util.List;

import edu.cvtc.web.model.Person;

/**
 * @author gcedarblade
 *
 */
public interface PersonDao {
	
	void createDatabase() throws ClassNotFoundException, SQLException;
	
	void insert(Person person) throws ClassNotFoundException, SQLException;
	
	List<Person> retrievePeople() throws ClassNotFoundException, SQLException;

}
