package com.mftour.spring.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mftour.spring.Dao.IProductDao;
import com.mftour.spring.Dao.IptopDao;
import com.mftour.spring.model.TAdministrator;
import com.mftour.spring.model.TChannel;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TNews;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IptopService;


@Service("ptopService")
public class PtopServiceImpl  implements  IptopService  {
	
	
	@Autowired
	private IptopDao ptopDao;

	@Override
	public void addOrUpdate(TProduct tproduct) throws Exception {
		         ptopDao.addOrUpdate(tproduct);
		
	}

	

	@Override
	public TAdministrator getAdministratorByAccount(String account)
			throws Exception {
		List list= ptopDao.getAdministratorByAccount(account);
	             	
        
		 return list==null || list.size() == 0 ? null : (TAdministrator)list.get(0);
	}



	@Override
	public void addOrUpdateInvestmentInfo(TInvestmentInfo investmentInfo)
			throws Exception {
		
		     ptopDao.addOrUpdateInvestmentInfo(investmentInfo);
		  
		
	}



	@Override
	public List<TInvestmentInfo> queryInvestmentInfoByNumber(String Number) {
		return  ptopDao.queryInvestmentInfoByNumber(Number);
		
	}



	@Override
	public void deleteTInvestmentInfo(Long id) throws Exception {
		ptopDao.deleteTInvestmentInfo(id);
		
	}



	@Override
	public void addOrUpdateTNews(TNews news) throws Exception {
		ptopDao.addOrUpdateTNews(news);
		
	}



	@Override
	public void addOrUpdateTChannel(TChannel channel) throws Exception {
		ptopDao.addOrUpdateTChannel(channel);
		
	}



	@Override
	public List<TChannel> getChannel() throws Exception {
		return  ptopDao.getChannel();
		 
	}



	@Override
	public List<TNews> getNews() throws Exception {
		
		return ptopDao.getNews();
	}



	@Override
	public List<TChannel> getChannelById(Long id) {
		
		return ptopDao.getChannelById(id);
	}



	@Override
	public List<TNews> getNewsByName(String name) {
		
		return ptopDao.getNewsByName(name);
	}
	
	
	


	@Override
	public List<TNews> getWebsiteNoticeByChannel() throws Exception {
		
		return ptopDao.getWebsiteNoticeByChannel();
	}



	@Override
	public List<TNews> getRepaymentNoticeByChannel() throws Exception {
		
		return ptopDao.getRepaymentNoticeByChannel();
	}



	@Override
	public TNews getTNewsById(Long id) {
		
		return ptopDao.getTNewsById(id);
	}



	@Override
	public void deleteNews(Long id) throws Exception {
		ptopDao.deleteNews(id);
		
	}



	@Override
	public void deleteTChannel(Long id) throws Exception {
		ptopDao.deleteTChannel(id);
		
	}



	@Override
	public List<TNews> getNewsbyRecommend() throws Exception {
		
		return ptopDao.getNewsbyRecommend();
	}



	@Override
	public List<TNews> getNewsbyTime() throws Exception {
		
		return ptopDao.getNewsbyTime();
	}



	@Override
	public TInvestmentInfo queryTInvestmentInfo(Long id) throws Exception {
		
		return ptopDao.queryTInvestmentInfo(id);
		
	}

	
	
	
	
	
	
	
	
	

	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
}
