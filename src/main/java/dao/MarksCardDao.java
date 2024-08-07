package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import dto.MarksCard;

public class MarksCardDao
{
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("dev");
	EntityManager manager = factory.createEntityManager();
	EntityTransaction transaction = manager.getTransaction();

	public MarksCard find(int id)
	{
		return manager.find(MarksCard.class, id);
	}
	
	public void update(MarksCard card)
	{
		transaction.begin();
		manager.merge(card);
		transaction.commit();
	}

	public void save(MarksCard card) {
		transaction.begin();
		manager.persist(card);
		transaction.commit();
	}
}
