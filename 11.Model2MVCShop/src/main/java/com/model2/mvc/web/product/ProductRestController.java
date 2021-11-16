package com.model2.mvc.web.product;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public ProductRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value ="json/getProduct/{prodNo}",method = RequestMethod.GET)
	public Product getProduct(@PathVariable() int prodNo) throws Exception{
		System.out.println("/product/json/getProduct:POST");
		
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping(value="json/addProduct", method = RequestMethod.POST)
	public Product addProduct(@RequestBody Product product) throws Exception{
		System.out.println("/product/addProduct : POST");
		
		productService.addProduct(product);
		
		return productService.getProduct(product.getProdNo());
		
	}
	
	@RequestMapping(value ="json/updateProduct", method=RequestMethod.POST)
	public Product updateProduct(@RequestBody Product product) throws Exception{
		
		System.out.println("RestController¡¯¿‘");
		productService.updateProduct(product);
		
		return productService.getProduct(product.getProdNo());
	}
	
	@RequestMapping(value="json/listProduct",method = RequestMethod.POST)
	public Map<String,Object> listProductPost(@RequestBody Search search) throws Exception{
		System.out.println("/product/listProduct:GET/POST");
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(search.getCurrentPage() ==0) {
			search.setCurrentPage(1);		
		}
		search.setPageSize(pageSize);
		
		map=productService.getProductList(search);
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(),pageUnit,pageSize);
		System.out.println("resultPage:" + resultPage);
		
		map.put("resultPage",resultPage);
		map.put("search",search);
		
		return map;
		
	}
	
	
	
}
