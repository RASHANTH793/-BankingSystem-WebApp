package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import jakarta.servlet.http.HttpSession;

import com.model.TransactionModel;
import com.model.Transaction;
import com.model.TransactionID;


public class BankModel {
	private Connection con;
	HttpSession se;

	public BankModel(HttpSession session) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Bankmvcdb", "root", "tiger");
		se = session;

	}

	public String Register(String name, String phone, String email, String pw) {
		PreparedStatement ps;
		String status = "";
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery("select * from customer where phone='" + phone + "' and email='" + email + "' ");
			boolean b = rs.next();
			if (b) {
				status = "existed";
			} else {
				ps = (PreparedStatement) con.prepareStatement("insert into customer values(0,?,?,?,?,0,now())");
				ps.setString(1, name);
				ps.setString(2, phone);
				ps.setString(3, email);
				ps.setString(4, pw);
				int a = ps.executeUpdate();
				if (a > 0) {
					status = "success";
				} else {
					status = "failure";
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	public String login(String mail, String pass) {
		String status1 = "";
		long id;
		String name = "", email = "";
		double amount;

		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from customer where email='" + mail + "' and pin='" + pass + "';");

			if (rs.next()) {
				Customer c = new Customer();
				c.setAccno(rs.getLong("acc_no"));
				c.setName(rs.getString("name"));
				c.setPhone(rs.getLong("phone"));
				c.setMail(rs.getString("email"));
				c.setPin(rs.getString("pin"));
				c.setbal(rs.getDouble("balanace"));
				id = rs.getLong("acc_no");
				name = rs.getString("name");
				email = rs.getString("email");
				amount = rs.getDouble("Balanace");
				se.setAttribute("uname", name);
				se.setAttribute("email", email);
				se.setAttribute("id", id);
				se.setAttribute("bal", amount);
				status1 = "success";
			} else {
				status1 = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status1;
	}

	public String AmountDeposit(String money) throws SQLException, ClassNotFoundException {
		Customer c = new Customer();
		String status = "";
		double amount = 0.0;
		TransactionModel tm = new TransactionModel();
		try {
			Statement st = null;

			st = con.createStatement();
			int res = st.executeUpdate("update customer set balanace = balanace+'" + money + "' where acc_no = '"
					+ se.getAttribute("id") + "';");
			long acc_no = (long) se.getAttribute("id");
			if (res > 0) {
				double am = (double) se.getAttribute("bal");
				double mo = Double.parseDouble(money);
				amount = am + mo;
				c.setbal(amount);
				se.setAttribute("mo", mo);
				se.setAttribute("bal", amount);
				Transaction t = new Transaction();
				t.setTransactionID(TransactionID.generatetransactionID());
				t.setUser(acc_no);
				t.setRec_acc(acc_no);
				t.setTransaction("CREDITED");
				t.setAmount(mo);
				t.setBalance(c.getbal());
				boolean result = tm.insertTransaction(t);
				if (result) {
					status = "success";
				} else {
					status = "failure";
				}
			} else {
				status = "failure";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	public Customer getInfo() {
		Statement st = null;
		ResultSet rs = null;
		Customer c = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery("select * from Customer where acc_no= '" + se.getAttribute("id") + "';");
			boolean b = rs.next();
			if (b == true) {
				c = new Customer();
				c.setName(rs.getString("name"));
				c.setPhone(rs.getLong("phone"));
				c.setMail(rs.getString("email"));
			} else {
				c = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return c;
	}

	public String update(String name, String pno, String email) {
		String status = "";
		Statement st = null;
		try {
			st = con.createStatement();
			st.executeUpdate("update customer set name='" + name + "',phone='" + pno + "',email='" + email
					+ "' where acc_no= '" + se.getAttribute("id") + "';");
			se.setAttribute("uname", name);
			status = "success";
		} catch (Exception e) {
			status = "failure";
			e.printStackTrace();
		}

		return status;
	}

	public Customer getCustomer(long AccountNumber) {
		
		Customer cu = null;

		try (PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE acc_no = ?;")) {
			ps.setLong(1, AccountNumber);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					cu = new Customer();
					cu.setAccno(rs.getLong("acc_no"));
					cu.setName(rs.getString("name"));
					cu.setPhone(rs.getLong("phone"));
					cu.setMail(rs.getString("Email"));
					cu.setPin(rs.getString("pin"));
					cu.setbal(rs.getDouble("balanace"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cu;
	}


//	public String CheckDetails(double Amount, long AccountNumber, String Password) throws SQLException, ClassNotFoundException {
//	    Customer sender = getCustomer((long) se.getAttribute("id"));
//	    if (sender == null) {
//	        return "SenderNotFound";
//	    }
//
//	    Customer recipient = getCustomer(AccountNumber);
//	    if (recipient == null) {
//	        return "RecipientNotFound";
//	    }
//
//	    if (sender.getAccno() == recipient.getAccno()) {
//	        return "SameAccountError";
//	    }
//
//	    if (Amount <= 0 || sender.getbal() < Amount) {
//	        return "InsufficientFunds";
//	    }
//
//	    if (!sender.getPin().equals(Password)) {
//	        return "PasswordError";
//	    }
//
//	    try {
//	        con.setAutoCommit(false);
//
//	        sender.setbal(sender.getbal() - Amount);
//	        if (!updateCustomer(sender)) {
//	            con.rollback();
//	            return "SenderUpdateError";
//	        }
//
//	        recipient.setbal(recipient.getbal() + Amount);
//	        if (!updateCustomer(recipient)) {
//	            con.rollback();
//	            return "RecipientUpdateError";
//	        }
//
//	        TransactionModel tm = new TransactionModel();
//	        Transaction debitTransaction = new Transaction();
//	        debitTransaction.setTransactionID(TransactionID.generatetransactionID());
//	        debitTransaction.setUser(sender.getAccno());
//	        debitTransaction.setRec_acc(recipient.getAccno());
//	        debitTransaction.setTransaction("DEBITED");
//	        debitTransaction.setAmount(Amount);
//	        debitTransaction.setBalance(sender.getbal());
//	        if (!tm.insertTransaction(debitTransaction)) {
//	            con.rollback();
//	            return "DebitTransactionError";
//	        }
//
//	        Transaction creditTransaction = new Transaction();
//	        creditTransaction.setTransactionID(debitTransaction.getTransactionID());
//	        creditTransaction.setUser(recipient.getAccno());
//	        creditTransaction.setRec_acc(sender.getAccno());
//	        creditTransaction.setTransaction("CREDITED");
//	        creditTransaction.setAmount(Amount);
//	        creditTransaction.setBalance(recipient.getbal());
//	        if (!tm.insertTransaction(creditTransaction)) {
//	            con.rollback();
//	            return "CreditTransactionError";
//	        }
//
//	        con.commit();
//	        return "Success";
//	    } catch (SQLException e) {
//	        con.rollback();
//	        e.printStackTrace();
//	        return "TransactionError";
//	    } finally {
//	        con.setAutoCommit(true);
//	    }
//	}
	public String CheckDetails(String Amount, String AccountNumber, String Password) throws ClassNotFoundException, SQLException{
		Customer c = getCustomer((long) se.getAttribute("id"));
		TransactionModel tm = new TransactionModel();
		String Status = "";
		Transaction t1;
		Transaction t2;
		double amt = Double.parseDouble(Amount);
		long Acn = Long.parseLong(AccountNumber);
		Customer rec_acc = getCustomer(Acn);
    	if(c.getAccno() != rec_acc.getAccno()){
    		if(c.getbal() > 0 && c.getbal()>= amt && amt >0) {
    			if(c.getPin().equals(Password)) {
    				c.setbal(c.getbal()-amt);
    				boolean c_res=updateCustomer(c);
    				if(c_res) {
    			    	t1= new Transaction(); 
    			    	t1.setTransactionID(TransactionID.generatetransactionID());
    			    	t1.setUser(c.getAccno()); 
    			        t1.setRec_acc(rec_acc.getAccno()); 
    			        t1.setTransaction("DEBITED"); 
    			        t1.setAmount(amt); 
    			        t1.setBalance(c.getbal());
    			        boolean res1 = tm.insertTransaction(t1);
    			        rec_acc.setbal(rec_acc.getbal()+amt); 
    			        boolean receiver_res=updateCustomer(rec_acc); 
    			        if(receiver_res) {
    			        	{
    			        		t2= new Transaction();
    			        		t2.setTransactionID(t1.getTransactionID()); 
    			        	    t2.setUser(rec_acc.getAccno()); 
    			        	    t2.setRec_acc(c.getAccno()); 
    			        	    t2.setTransaction("CREDITED"); 
    			        	    t2.setAmount(amt); 
    			        	    t2.setBalance(rec_acc.getbal()); 
    			        	    boolean res11=tm.insertTransaction(t2);
    			        	    Status ="sucess";
    			        	}
    			}	
    		}else {
    			Status="PasswordError";	
    		}
    	}else {
    		Status = "AmountError";
    	}
    		
	}else {
		Status = "AccountError";
	}
    }
    	return Status;
	}


	private boolean updateCustomer(Customer c) {
		PreparedStatement ps = null;
		int res = 0;
		String query = "UPDATE CUSTOMER SET NAME =?, PHONE=?, EMAIL=?,PIN=?, BALANACE=?  WHERE ACC_NO=?";
		try {
			con.setAutoCommit(false);
			ps = con.prepareStatement(query);
			ps.setString(1, c.getName());
			ps.setLong(2, c.getPhone());
			ps.setString(3, c.getMail());
			ps.setString(4, c.getPin());
			ps.setDouble(5, c.getbal());
			ps.setLong(6, c.getAccno());
			res = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (res > 0) {
			try {
				con.commit();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		} else {
			try {
				con.rollback();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return true;
	}

}
