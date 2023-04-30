package com.kheti.Inventory.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kheti.Inventory.model.ProductItem;
import com.kheti.Inventory.model.User;
import com.kheti.Inventory.model.Category;
import com.kheti.Inventory.model.Expense;
import com.kheti.Inventory.model.Organization;
import com.kheti.Inventory.model.Payment;
import com.kheti.Inventory.service.CategoryService;
import com.kheti.Inventory.service.ExpenseService;
import com.kheti.Inventory.service.OrganizationService;
import com.kheti.Inventory.service.PaymentService;
import com.kheti.Inventory.service.ProductService;
import com.kheti.Inventory.util.Constants;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ExpenseController {

	@Autowired
	ExpenseService expenseService;

	@Autowired
	ProductService productService;

	@Autowired
	PaymentService paymentService;

	@Autowired
	OrganizationService organizationService;

	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = "/createExpense", method = RequestMethod.GET)
	public String showCreateExpensePage(ModelMap model, HttpServletRequest request) {
		System.out.println("Expense Controller -> showCreateExpensePage");
		String expenseId = request.getParameter("id");
		Expense expense = null;
		if (expenseId != null && !expenseId.isBlank()) {
			expense = expenseService.getExpense(Integer.parseInt(expenseId));

		}
		model.put("expense", expense == null ? new Expense() : expense);

		List<Organization> organizations = organizationService.getAllOrganization();
		request.setAttribute("organizations", organizations);
		List<Category> categories= categoryService.getAllCategory();
		request.setAttribute("categories", categories);

		return "createExpense";
	}

	@RequestMapping(value = "/createExpense", method = RequestMethod.POST)
	public String createExpense(@ModelAttribute Expense expense, ModelMap model, HttpServletRequest request,
			HttpSession session) {
		System.out.println("Expense Controller -> createExpense");
		User user = (User) session.getAttribute("user");

		System.out.println("venderId: " + request.getParameter("venderId"));

		Organization vender = organizationService.getOrganization(Integer.parseInt(request.getParameter("venderId")));
		expense.setVender(vender);

		int newExpenseId = expenseService.saveExpense(expense);
		System.out.println("Expense Saved with ID: " + newExpenseId);

		List<ProductItem> productList = populateProductItems(request, expense, user.getId(), user.getOwnerId());
		expense.setProductList(productList);
		
		List<Payment> paymentList = populatePayments(request, expense, user.getId(), user.getOwnerId());
		expense.setPaymentList(paymentList);
		
		expenseService.saveExpense(expense); //Save after populating Products and Payments
		
		List<Organization> organizations = organizationService.getAllOrganization();
		request.setAttribute("organizations", organizations);
		List<Category> categories= categoryService.getAllCategory();
		request.setAttribute("categories", categories);

		model.put("expense", expense);
		model.put("errorMessage", "Record Saved Successfully");

		return "createExpense";
	}

	private List<Payment> populatePayments(HttpServletRequest request, Expense expense, int userId, int ownerId) {

		List<Payment> paymentList = new ArrayList<>();
		int paymentCount = Integer.parseInt(request.getParameter("paymentCount"));
		System.out.println("paymentCount : " + paymentCount);

		for (int i = 0; i < paymentCount; i++) {
				String amountS = request.getParameter("amount" + i);
				if (amountS == null || amountS.isBlank())
					continue;// seems this row is getting deleted

				double amount = Double.parseDouble(amountS);
				String paymentType = request.getParameter("paymentType" + i);
				Payment payment = null;
				String paymentId = request.getParameter("paymentId" + i);
				if (null != paymentId && Integer.parseInt(paymentId) > 0) {
					payment = paymentService.getPayment(Integer.parseInt(paymentId));
					payment.setAmout(amount);
					payment.setEnteredBy(userId);
					payment.setEnteredOn(new Date());
					payment.setExpense(expense);
					payment.setOwnerId(ownerId);
					payment.setPaymentType(paymentType);
				} else {
					payment = new Payment(userId, new Date(), ownerId, expense,amount,paymentType); 
				}
				paymentService.savePayment(payment);
				System.out.println("Payment: " + i + " : " + payment.getId());
				paymentList.add(payment);

		}
		return paymentList;

	}

	private List<ProductItem> populateProductItems(HttpServletRequest request, Expense expense, int userId,
			int ownerId) {

		List<ProductItem> productList = new ArrayList<>();
		int productCount = Integer.parseInt(request.getParameter("productCount"));
		System.out.println("productCount : " + productCount);

		for (int i = 0; i < productCount; i++) {
			try {

				String productName = request.getParameter("productName" + i);
				if (productName == null || productName.isBlank())
					continue;// seems this row is getting deleted

				int categoryId = Integer.parseInt(request.getParameter("category" + i));
				Category category = categoryService.getCategory(categoryId);

				String brandName = request.getParameter("brandName" + i);
				String unitType = request.getParameter("unitType" + i);

				String subUnitType = Constants.isUnitType(unitType) ? request.getParameter("subUnitType" + i) : null;
				double quantity = Double.parseDouble(request.getParameter("quantity" + i));
				double unitPrice = Double.parseDouble(request.getParameter("unitPrice" + i));
				double taxPercentage = Double.parseDouble(request.getParameter("taxPercentage" + i));
				String expiryDateS = request.getParameter("expiryDate" + i);
				Date expiryDate = expiryDateS.isBlank() ? null : new SimpleDateFormat("dd/MM/yyyy").parse(expiryDateS);

				ProductItem product = null;
				String productId = request.getParameter("productId" + i);
				if (null != productId && Integer.parseInt(productId) > 0) {
					product = productService.getProductItem(Integer.parseInt(productId));
					product.setBrandName(brandName);
					product.setCategory(category);
					product.setEnteredBy(userId);
					product.setEnteredOn(new Date());
					product.setExpense(expense);
					product.setExpiryDate(expiryDate);
					product.setOwnerId(ownerId);
					product.setProductName(productName);
					product.setQuantity(quantity);
					product.setSubUnitType(subUnitType);
					product.setTaxPercentage(taxPercentage);
					product.setUnitPrice(unitPrice);
					product.setUnitType(unitType);
				} else {
					product = new ProductItem(userId, new Date(), ownerId, expense, category, productName, brandName,
							unitType, subUnitType, quantity, unitPrice, taxPercentage, expiryDate);
				}
				productService.saveProductItem(product);
				System.out.println("ProductItem: " + i + " : " + product.getId());
				productList.add(product);
			} catch (ParseException e) {
				e.printStackTrace();
			}

		}
		return productList;
	}

	@RequestMapping(value = "/listExpense", method = RequestMethod.GET)
	public String listExpense(HttpServletRequest request) {
		System.out.println("Expense Controller -> listExpense");

		List<Expense> expenseList = expenseService.getAllExpense();
		request.setAttribute("expenseList", expenseList);

		return "listExpense";
	}

}
