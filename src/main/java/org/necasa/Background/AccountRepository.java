package org.Necasa.Background;

import org.Necasa.Web.Account;
import org.springframework.data.repository.CrudRepository;

public interface AccountRepository extends CrudRepository <Account, Long> {
	Account findByuserid(String userid);
}
