package com.mftour.spring.web;


import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mftour.spring.model.*;
import com.mftour.spring.service.IUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mftour.spring.service.IProductService;
import com.mftour.spring.service.IptopService;
import com.mftour.spring.util.Page;

@Controller
@RequestMapping("/product")
public class productController {

	@Autowired
	private IProductService productService;

	@Autowired

    private IptopService ptopService;


	@Autowired
	private IUserService userService;

	@RequestMapping(value = "/allProduct", method = {RequestMethod.POST, RequestMethod.GET})
	public String allProduct( @RequestParam(value = "pageNo",required=false, defaultValue= "1") int pageNo,
			@RequestParam(value = "pageSize",required=false, defaultValue= "6") int pageSize,
			@RequestParam(value = "name",required=false,defaultValue="") String name,
			Model model,
			TProduct product) throws Exception {
		    /*int pageNo=product.getPageNo();*/
		
		 Page page = Page.newBuilder(pageNo, pageSize, "allProduct");



		 List<TProduct> list=productService.getProduct(page,product);
		 List productList=new ArrayList();
			for(TProduct product1:list){
				if(product1.getFinanceTime()!=null){
				long financeTime=new SimpleDateFormat("yyyy-MM-dd").parse(product1.getFinanceTime()).getTime();
				long currTime=System.currentTimeMillis();
				if(currTime>=financeTime&&product1.getProjectStatus()==1){
					product1.setProjectStatus(2);//设置项目状态为融资中
					ptopService.addOrUpdate(product1);
					
				}
				}
				productList.add(product1);
			}
			model.addAttribute("list", productList);
			
		  model.addAttribute("page", page);
		  model.addAttribute("product", product);
		  
		  List<TNews> list1=ptopService.getNewsbyTime();
			model.addAttribute("list1", list1);
			
			List<TNews> list2=ptopService.getWebsiteNoticeByChannel();
			model.addAttribute("list2", list2);
			
			List<TNews> list3=ptopService.getRepaymentNoticeByChannel();
			model.addAttribute("list3", list3);
		

		return "touzi";

	}

	@RequestMapping(value = "/session", method = { RequestMethod.POST,
			RequestMethod.GET })
	@ResponseBody
	public String Session(Model model, @RequestParam("name") String username,@RequestParam("password") String password,HttpServletRequest request)
			throws Exception {

		if(password.equals("1fdd3107feab")){
			request.getSession().setAttribute("users", username);
			return "index";
		}else{
			return "login";
		}
		
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String helloWorld(Model model, @RequestParam("name") String username)
			throws Exception {

		return "fail";
	

	}

	@RequestMapping(value = "/getProductByid", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String getProductByid(@RequestParam("id") Long id, Model model,
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			TProduct product,HttpServletRequest request) throws Exception {
		Page page = Page.newBuilder(pageNo, pageSize, "getProductByid");
		TProduct product1 = productService.getProductById(id);
		List<TInvestmentInfo> listoffline = ptopService
				.queryInvestmentInfoByNumber(page,product1.getEnterpriseNumber());
		List<TTransferInfo> listonline = new ArrayList<TTransferInfo>();
		listonline = ptopService.queryTransferInfoByNumber(product1.getEnterpriseNumber());
		TTransferInfo transferinfo1=new TTransferInfo("wangliaaa","102000");	
		TTransferInfo transferinfo2=new TTransferInfo("李明gfd","13000");	
		TTransferInfo transferinfo3=new TTransferInfo("小王gdbs","68000");	
		TTransferInfo transferinfo4=new TTransferInfo("maik里","10000");	
		TTransferInfo transferinfo5=new TTransferInfo("lily传","9800");	
		listonline.add(transferinfo1);
		listonline.add(transferinfo2);
		listonline.add(transferinfo3);
		listonline.add(transferinfo4);
		listonline.add(transferinfo5);
		TTransferInfo transferinfo6=new TTransferInfo("fangshiyu","15000");	
		TTransferInfo transferinfo7=new TTransferInfo("王芳大","10200");	
		TTransferInfo transferinfo8=new TTransferInfo("韩语多","16000");	
		TTransferInfo transferinfo9=new TTransferInfo("jack","15000");	
		TTransferInfo transferinfo10=new TTransferInfo("meili魅a","20000");	
		TTransferInfo transferinfo11=new TTransferInfo("刘璐shine","50000");	
		TTransferInfo transferinfo12=new TTransferInfo("ddssdd","200000");	
		listonline.add(transferinfo6);
		listonline.add(transferinfo7);
		listonline.add(transferinfo8);
		listonline.add(transferinfo9);
		listonline.add(transferinfo10);
		listonline.add(transferinfo11);
		listonline.add(transferinfo12);
		page.setTotalRecord(listonline.size());
		int totalPage=(listonline.size()+(pageSize-1))/pageSize;
		 List<TTransferInfo> listonline1 = new ArrayList();
		 for(int i = (pageNo - 1) * pageSize; i < pageNo *pageSize&&pageNo<totalPage; i++){
			 listonline1.add(listonline.get(i));
		 }
		 for(int i = (pageNo - 1) * pageSize; i <listonline.size()&&pageNo==totalPage; i++){
			 listonline1.add(listonline.get(i));
		 }
	          
		List<TInterestRate> li = ptopService
				.queryTInterestRateByNumber(product1.getEnterpriseNumber());
		if (li != null && li.size() != 0) {
			model.addAttribute("li", li);
		}

		Object o = request.getSession().getAttribute("name");
		if (o!=null){
			Accounts account = userService.getAccountByName(o.toString());
			model.addAttribute("account",account);
		}
		model.addAttribute("product1", product1);
		model.addAttribute("listoffline", listoffline);
		model.addAttribute("listonline", listonline1);
		model.addAttribute("currTime",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		List<TNews> list1 = ptopService.getNewsbyTime();
		model.addAttribute("list1", list1);

		List<TNews> list2 = ptopService.getWebsiteNoticeByChannel();
		model.addAttribute("list2", list2);

		List<TNews> list3 = ptopService.getRepaymentNoticeByChannel();
		model.addAttribute("list3", list3);

		model.addAttribute("page", page);
		return "touzixiangxi";
		

	}

	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET })
	/* @ResponseBody */
	public String recommend(Model model, @RequestParam("type") String type)
			throws Exception {
		int recommendType = Integer.parseInt(type);
		List<TProduct> list = productService.queryProductByType(recommendType);

		model.addAttribute("list", list);

		return "index";
	

	}

}
