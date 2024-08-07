package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import dto.Student;

public class StudentDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("dev");
	EntityManager manager = factory.createEntityManager();
	EntityTransaction transaction = manager.getTransaction();

	public void save(Student student) {
		transaction.begin();
		manager.persist(student);
		transaction.commit();
	}

	public Student find(String email) {
		List<Student> list = manager.createQuery("select x from Student x where email=?1").setParameter(1, email)
				.getResultList();
		if (list.isEmpty()) {
			return null;
		} else {
			return list.get(0);
		}
	}

	public Student find(int empreg) {
		return manager.find(Student.class, empreg);
	}

	public Student find(long mobile) {
		List<Student> list = manager.createQuery("select x from Student x where mobile=?1").setParameter(1, mobile)
				.getResultList();
		if (list.isEmpty()) {
			return null;
		} else {
			return list.get(0);
		}
	}

	public void update(Student student) {
		transaction.begin();
		manager.merge(student);
		transaction.commit();
	}
	
	public List<Student> fetchAll()
	{
		return manager.createQuery("select x from Student x").getResultList();
	}
	
}
