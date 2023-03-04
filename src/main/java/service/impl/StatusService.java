package service.impl;



import dao.IStatusDao;
import model.Status;
import service.IStatusService;

import javax.inject.Inject;
import java.util.List;

public class StatusService implements IStatusService {
    @Inject
    private IStatusDao statusDao;

    @Override
    public List<Status> findAll() {
        return statusDao.findAll();
    }
}
