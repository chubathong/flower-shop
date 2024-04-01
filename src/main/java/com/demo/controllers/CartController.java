package com.demo.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Item;
import com.demo.models.Orders;
import com.demo.models.Ordersdetail;
import com.demo.models.OrdersdetailId;
import com.demo.models.Product;
import com.demo.services.AccountService;
import com.demo.services.CategoryService;
import com.demo.services.OrderDetailService;
import com.demo.services.OrderService;
import com.demo.services.ProductService;

@Controller
@RequestMapping({"cart"})
public class CartController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService orderDetailService;

	@RequestMapping(value = {"index"} , method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("categorys",categoryService.findAll());
		return "cart/index";
	}
	
	@RequestMapping(value = {"buy/{id}"} , method = RequestMethod.GET)
	public String buy(@PathVariable("id") int id,HttpSession session) {
		Product  product=productService.find(id);
		if(session.getAttribute("cart")==null) {
			List<Item> cart = new ArrayList<Item>();
			cart.add(new Item(product,1));
			session.setAttribute("cart", cart);
		}else {
			List<Item> cart=(List<Item>) session.getAttribute("cart"); //tạo session cart
			int index=  productService.exists(id, cart);
			if(index==-1) {
				cart.add(new Item(product,1));
			}else {
				int newQuantity= cart.get(index).getQuantity()+1;
				cart.get(index).setQuantity(newQuantity);
			}
			
			session.setAttribute("cart", cart);
		}
		return "redirect:/cart/index";
	}
	@RequestMapping(value = "remove/{index}" , method = RequestMethod.GET)
	public String remove(@PathVariable("index") int index,HttpSession session) {
		List<Item> cart=(List<Item>) session.getAttribute("cart");
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:/cart/index";
	}
	
	@RequestMapping(value = "checkout" , method = RequestMethod.GET)
	public String checkout(HttpSession session) {
		if(session.getAttribute("username") == null) {
			return "redirect:/layout/myaccount";
		}else {
			if(session.getAttribute("cart")==null) {
				
				return "redirect:/layout/home";
				
			}else {
				//add new order
				Orders orders =new Orders();
				orders.setName("New Order");
				orders.setCreated(new Date());
				orders.setStatus(false);
				orders.setAccount(accountService.findOne(session.getAttribute("username").toString()));
				int newOrderId = this.orderService.create(orders).getId(); 
				//add new order detail
				List<Item> cart=(List<Item>) session.getAttribute("cart");
				for(Item item:cart) {
					Ordersdetail ordersdetail=new Ordersdetail();
					ordersdetail.setId(new OrdersdetailId(newOrderId,item.getProduct().getId()));
					ordersdetail.setPrice(item.getProduct().getPrice());
					ordersdetail.setQuantity(item.getQuantity());
					this.orderDetailService.create(ordersdetail);
				}
				
				//remove cart
				session.removeAttribute("cart");
				return "cart/thanks";
			}
			
		}
		
	}
	@RequestMapping(value = "update" , method = RequestMethod.POST)
	public String update(@RequestParam("quantities") int[]quantities,HttpSession session) {
		
		List<Item> cart=(List<Item>) session.getAttribute("cart");
		for(int i=0;i<cart.size();i++) {
			cart.get(i).setQuantity(quantities[i]);
		}
		session.setAttribute("cart", cart);
		return "redirect:/cart/index";
	}
}
