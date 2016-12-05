package edu.cvtc.web.model;

/**
 * @author gcedarblade
 *
 */
public class Person {

	private String firstName;
	private String lastName;
	private String emailAddress;
	
	public Person(final String firstName, final String lastName, final String emailAddress) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.emailAddress = emailAddress;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	
	@Override
	public String toString() {
		return "Person [firstName=" + firstName + ", lastName=" + lastName + ", emailAddress=" + emailAddress + "]";
	}
	
}
