package com.mftour.spring.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mftour.spring.model.TAdministrator;
import com.mftour.spring.model.TChannel;
import com.mftour.spring.model.TInvestmentInfo;
import com.mftour.spring.model.TNews;
import com.mftour.spring.model.TProduct;
import com.mftour.spring.model.TUser;
import com.mftour.spring.service.IProductService;
import com.mftour.spring.service.IptopService;




@Controller
@RequestMapping("/Login")
public class ptopController {
	
	
	@Autowired
    private IptopService ptopService;
	
	@Autowired
    private IProductService productService;
	
	@RequestMapping(method = {RequestMethod.POST, RequestMethod.GET})
	public String helloWorld(Model model) throws Exception {
	
	
		/*return "news_add";*/
		/*return "ptop/p2b_add";*/
		return "ptop/login";
		/*return "indexs";*/
	}
	
	
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	@ResponseBody
	public String helloWorld(TAdministrator administrator, Model model,@RequestParam("name") String name,@RequestParam("password") String password ) throws Exception {
		System.out.println("dddd"+administrator.getName());
		System.out.println("dddddd"+administrator.getPassword());
		
		           
	/*TUser user1 = userService.getUserByAccount(user.getName());*/
	TAdministrator administrator1=ptopService.getAdministratorByAccount(administrator.getName());
	   if(administrator1!=null){
		   if(administrator1.getPassword().equals(administrator.getPassword())){
			   model.addAttribute("name", administrator.getName()); 
			   return "success";
		   }
	   }
	   /*System.out.println(user1.getName()+"www"+user1.getPassword());*/
	    
	   return "fail";
/*	    return "user/chpasswd";*/
	    
		
	}
	
	@RequestMapping(value = "/session", method = {RequestMethod.POST, RequestMethod.GET})
	public String Session( Model model,TAdministrator TAdministrator,HttpServletRequest request) throws Exception {
	
		
		System.out.println("ffffffffffffffffffffffffff");
		 	 
		/*model.addAttribute("  Administrator",TAdministrator.getName()); */
		request.getSession().setAttribute("  Administrator",TAdministrator.getName()); 
//		request.getSession().setAttribute("users", username);
		return "ptop/p2b_add";
}
	
	
	
	
	@RequestMapping(value = "/addproduct", method = {RequestMethod.POST, RequestMethod.GET})
		public String addproduct( Model model,TProduct product) throws Exception {
		 
		 System.out.println("ddddddddddddddd"+product.getProjectName());
		 
	         	
	         	 
	         	try {
	         		 ptopService.addOrUpdate(product);
	               
	                model.addAttribute("mes", "操作成功");
	                
	            } catch (Exception e) {
	                e.printStackTrace();
	              /*  map.put("mes", "操作失败");*/
	                throw e;
	            }
	            
	  	 
		 
		
		 	 
		/*model.addAttribute("name",user.getName());*/ 
	     
//		request.getSession().setAttribute("users", username);
		return "ptop/p2b_add";
}
	

	@RequestMapping(value = "/queryproduct", method = {RequestMethod.POST, RequestMethod.GET})
	public String queryproduct( Model model,TProduct product) throws Exception {
	
         	
         	try {
         		List<TProduct> list=productService.queryProduct(product);
         		model.addAttribute("list", list);
               
              /*  model.addAttribute("mes", "操作成功");*/
                
            } catch (Exception e) {
                e.printStackTrace();
              /*  map.put("mes", "操作失败");*/
                throw e;
            }
            
  	 
	 
	
	 	 
	/*model.addAttribute("name",user.getName());*/ 
     
//	request.getSession().setAttribute("users", username);
	return "ptop/p2b_manage";
}

	
	@RequestMapping(value = "/getProductByid", method = {RequestMethod.POST, RequestMethod.GET})
	public String getProductByid(@RequestParam("id") Long id,
			Model model,
			TProduct product) throws Exception {
		
		
	
		 
		TProduct product1= productService.getProductById(id);
		
		List<TInvestmentInfo> list=ptopService.queryInvestmentInfoByNumber(product1.getEnterpriseNumber());
		 model.addAttribute("list", list);
		 model.addAttribute("product1", product1);
		
		return "ptop/p2b_update";
		
	}
	
	@RequestMapping(value = "/investmentinfo", method = {RequestMethod.POST, RequestMethod.GET})
	public String investmentinfo(
			Model model,HttpServletRequest request,
			TInvestmentInfo  investmentInfo ) throws Exception {
		
		 System.out.println("rrrrrrrrrrrrrrrrrrrrrrrrrrr");
		
			 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			 System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
			 investmentInfo.setWriteTime(df.format(new Date()));;
			  Object o=request.getSession().getAttribute("Administrator");
			 investmentInfo.setAdministratorName(o.toString());
			 
		         ptopService.addOrUpdateInvestmentInfo(investmentInfo);
		         List<TProduct> lis= productService.queryProductByNumber(investmentInfo.getEnterpriseNumber());
		         TProduct t=lis.get(0);
		          
		            Double RealityMoney=t.getRealityMoney();
		            System.out.println("vvvvvvvvvv"+investmentInfo.getInvestmentAmount()+"vvvvvvvvvvvvvvvv"+RealityMoney);
		            if(RealityMoney==null){
		            	t.setRealityMoney(investmentInfo.getInvestmentAmount());
		            	t.setFinancingProgress(investmentInfo.getInvestmentAmount()/t.getFinancingMoney()*100);
		            }else{
		            	Double  money=RealityMoney+investmentInfo.getInvestmentAmount();
		            	t.setRealityMoney(money);
		            	t.setFinancingProgress(money/t.getFinancingMoney()*100);
		            }
		            
		            System.out.println("vvvvvvvvvvvvvvvvvvvvvvvvvv");
		            
		            ptopService.addOrUpdate(t);
		         
		         
		  List<TInvestmentInfo> list=ptopService.queryInvestmentInfoByNumber(investmentInfo.getEnterpriseNumber());
			 model.addAttribute("list", list);
			 List<TProduct> li= productService.queryProductByNumber(investmentInfo.getEnterpriseNumber());
			 model.addAttribute("product1", li.get(0));
	         
		
		return "ptop/p2b_update";
		
	}
	
	
	@RequestMapping(value = "/deleteproduct", method = {RequestMethod.POST, RequestMethod.GET})
	public String deleteproduct( Model model,TProduct product,@RequestParam("id") Long id) throws Exception {
	
         	
         	try {
         		 productService.deleteProduct(id);
         		List<TProduct> list=productService.queryProduct(product);
         		model.addAttribute("list", list);
         		
               
              /*  model.addAttribute("mes", "操作成功");*/
                
            } catch (Exception e) {
                e.printStackTrace();
              /*  map.put("mes", "操作失败");*/
                throw e;
            }
           
	 	 
	/*model.addAttribute("name",user.getName());*/ 
     
//	request.getSession().setAttribute("users", username);
	return "ptop/p2b_manage";
}
	
	
	@RequestMapping(value = "/deleteTInvestmentInfo", method = {RequestMethod.POST, RequestMethod.GET})
	public String deleteTInvestmentInfo( Model model,TInvestmentInfo TInvestmentInfo,@RequestParam("id") Long id,
			@RequestParam("enterpriseNumber") String enterpriseNumber) throws Exception {
	
         	
         	try {
         		 ptopService.deleteTInvestmentInfo(id);
         		 
         		 List<TInvestmentInfo> list=ptopService.queryInvestmentInfoByNumber(enterpriseNumber);
    			 model.addAttribute("list", list);
    			 List<TProduct> li= productService.queryProductByNumber(enterpriseNumber);
    			 model.addAttribute("product1", li.get(0));
         		
         		
               
              /*  model.addAttribute("mes", "操作成功");*/
                
            } catch (Exception e) {
                e.printStackTrace();
              /*  map.put("mes", "操作失败");*/
                throw e;
            }
           
	 	 
	/*model.addAttribute("name",user.getName());*/ 
     
//	request.getSession().setAttribute("users", username);
         	return "ptop/p2b_update";
}
	
	
	@RequestMapping(value = "/updateProduct", method = {RequestMethod.POST, RequestMethod.GET})
	public String updateProduct(@RequestParam("id") Long id,
			Model model,
			TProduct product) throws Exception {
		
		
	
		 
		TProduct product1= productService.getProductById(id);
		
		 model.addAttribute("product1", product1);
		
		return "ptop/p2b_add";
		
	}
	
	
	@RequestMapping(value = "/addnews", method = {RequestMethod.POST, RequestMethod.GET})
	public String allnews(
			Model model,
			TNews news) throws Exception {
		System.out.println("cccccccccc"+news.getTitle());
		System.out.println("cccccccccc"+news.getChannel());
		
		try {
			 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			 System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
			 news.setTime(df.format(new Date()));
			ptopService.addOrUpdateTNews(news);
          
           List<TChannel> list1=ptopService.getChannel();
			model.addAttribute("list1", list1);
           
       } catch (Exception e) {
           e.printStackTrace();
         /*  map.put("mes", "操作失败");*/
           throw e;
       }
	
		 
		
		
		return "ptop/news_add";
		
	}
	
	
	@RequestMapping(value = "/channelManage", method = {RequestMethod.POST, RequestMethod.GET})
	public String channelManage(
			Model model,
			TChannel channel) throws Exception {
		
		try {
			System.out.println("ddddcccccccccccccccccc");
			
			List<TChannel> list=ptopService.getChannel();
			/*System.out.println("ddddcccccccccccccccccc"+list.get(0).getName());*/
			model.addAttribute("list", list);
          
        
       } catch (Exception e) {
           e.printStackTrace();
         /*  map.put("mes", "操作失败");*/
           throw e;
       }
	
		 
		
		
		return "ptop/channel_manage";
		
	}
	
	
	
	
	@RequestMapping(value = "/getNews", method = {RequestMethod.POST, RequestMethod.GET})
	public String getNews(
			Model model,
			TNews news) throws Exception {
		
		try {
			
			List<TNews> list=ptopService.getNews();
			List<TChannel> list1=ptopService.getChannel();
			
			model.addAttribute("list", list);
			model.addAttribute("list1", list1);
          
       
       } catch (Exception e) {
           e.printStackTrace();
         /*  map.put("mes", "操作失败");*/
           throw e;
       }
	
		 
		
		
		return "ptop/news_manage";
		
	}
	
	
	@RequestMapping(value = "/allchannel", method = {RequestMethod.POST, RequestMethod.GET})
	public String allchannel(
			Model model,
			TChannel channel) throws Exception {
		
		try {
			 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			 System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
			 channel.setTime(df.format(new Date()));
			 
			ptopService.addOrUpdateTChannel(channel);
			List<TChannel> list=ptopService.getChannel();
			model.addAttribute("list", list);
          
       
       } catch (Exception e) {
           e.printStackTrace();
         /*  map.put("mes", "操作失败");*/
           throw e;
       }
	
		 
		
		
		return "ptop/channel_manage";
		
	}
	
	
	@RequestMapping(value = "/getNewsbychannel", method = {RequestMethod.POST, RequestMethod.GET})
	public String getNewsbychannel(
			Model model,
			TChannel channel
			) throws Exception {
		
		List<TNews> list;
		
		try {
			if(channel.getId()==0){
				 list=ptopService.getNews();
				 
			}else {
				List<TChannel> li=ptopService.getChannelById(channel.getId());
				 list=ptopService.getNewsByName(li.get(0).getName());
				
			}
			
        List<TChannel> list1=ptopService.getChannel();
		
			model.addAttribute("list", list);
			
			
			model.addAttribute("list1", list1);
          
       
       } catch (Exception e) {
           e.printStackTrace();
         /*  map.put("mes", "操作失败");*/
           throw e;
       }
	
		 
		
		
		return "ptop/news_manage";
		
	}
	
	
	@RequestMapping(value = "/getChannel", method = {RequestMethod.POST, RequestMethod.GET})
	public String getChannel(
			Model model,
			TChannel channel) throws Exception {
		
		try {
			
			
			List<TChannel> list1=ptopService.getChannel();
			
		
			model.addAttribute("list1", list1);
          
       
       } catch (Exception e) {
           e.printStackTrace();
         /*  map.put("mes", "操作失败");*/
           throw e;
       }
	
		 
		
		
		return "ptop/news_add";
		
	}
	
	
	@RequestMapping(value = "/updateNewsbyId", method = {RequestMethod.POST, RequestMethod.GET})
	public String updateNews(
			Model model,
			TNews news) throws Exception {
			
		try {
			 
			TNews news1=ptopService.getTNewsById(news.getId());
          
			model.addAttribute("news1", news1);
			
			List<TChannel> list1=ptopService.getChannel();
			
			
			model.addAttribute("list1", list1);
           
       } catch (Exception e) {
           e.printStackTrace();
         /*  map.put("mes", "操作失败");*/
           throw e;
       }
	
		 
		
		
		return "ptop/news_add";
		
	}
	
	
	
	@RequestMapping(value = "/deleteNewsbyId", method = {RequestMethod.POST, RequestMethod.GET})
	public String deleteNews(
			Model model,
			TNews news) throws Exception {
			
		try {
			 
			ptopService.deleteNews(news.getId());
			List<TNews> list=ptopService.getNews();
			List<TChannel> list1=ptopService.getChannel();
			
			model.addAttribute("list", list);
			model.addAttribute("list1", list1);
           
       } catch (Exception e) {
           e.printStackTrace();
         /*  map.put("mes", "操作失败");*/
           throw e;
       }
	
		 
		
		
		return "ptop/news_manage";
		
	}
	
	
	
	@RequestMapping(value = "/deleteChannelbyId", method = {RequestMethod.POST, RequestMethod.GET})
	public String deleteChanne(
			Model model,
			TChannel channel) throws Exception {
			
		try {
			 
			ptopService.deleteTChannel(channel.getId());
			
			List<TChannel> list=ptopService.getChannel();
			
		
			model.addAttribute("list", list);
           
       } catch (Exception e) {
           e.printStackTrace();
         /*  map.put("mes", "操作失败");*/
           throw e;
       }
	
		 
		
		
		return "ptop/channel_manage";
		
	}
	
	
	
}
