package edu.cvtc.web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.cvtc.web.dao.PersonDao;
import edu.cvtc.web.model.Person;
import edu.cvtc.web.util.DBUtility;

/**
 * @author gcedarblade
 *
 */
public class PersonDaoImpl implements PersonDao {

	private static final String DROP_TABLE_PERSON = "drop table if exists person";
	private static final String CREATE_TABLE_PERSON = "create table person (id integer primary key autoincrement, firstName text, lastName text, emailAddress text);";
	private static final String SELECT_ALL_FROM_PERSON = "SELECT * from person";
			
	@Override
	public void createDatabase() throws ClassNotFoundException, SQLException{
		
		final Connection connection = DBUtility.createConnection();
		final Statement statement = connection.createStatement();

		try {
			statement.setQueryTimeout(DBUtility.TIMEOUT);
			statement.executeUpdate(DROP_TABLE_PERSON);
			statement.executeUpdate(CREATE_TABLE_PERSON);
		} finally {
			DBUtility.closeConnections(connection, statement);
		}
	}

	@Override
	public void insert(final Person person) throws ClassNotFoundException, SQLException{
		
		 Connection connection = null;
		 PreparedStatement preparedStatement = null;

		try {
			
			connection = DBUtility.createConnection();
			
			final String insertValues = "insert into person (firstName, lastName, emailAddress) values (?, ?, ?);";
			preparedStatement = connection.prepareStatement(insertValues);
			
			preparedStatement.setString(1, person.getFirstName());
			preparedStatement.setString(2, person.getLastName());
			preparedStatement.setString(3, person.getEmailAddress());
			
			preparedStatement.setQueryTimeout(DBUtility.TIMEOUT);
			
			preparedStatement.executeUpdate();
			
		} finally {
			DBUtility.closeConnections(connection, preparedStatement);
		}

	}

	@Override
	public List<Person> retrievePeople() throws ClassNotFoundException, SQLException{
		
		final Connection connection = DBUtility.createConnection();
		final Statement statement = connection.createStatement();

		final List<Person> people = new ArrayList<>();
		
		try {
			
			statement.setQueryTimeout(DBUtility.TIMEOUT);
			
			final ResultSet resultSet = statement.executeQuery(SELECT_ALL_FROM_PERSON);
			
			while (resultSet.next()) {
				
				final String firstName = resultSet.getString("firstName");
				final String lastName = resultSet.getString("lastName");
				final String emailAddress = resultSet.getString("emailAddress");
				
				final Person person = new Person(firstName, lastName, emailAddress);
				people.add(person);
				
			}
			
			resultSet.close();
			
		} finally {
			DBUtility.closeConnections(connection, statement);
		}
		
		return people;
	}

}
