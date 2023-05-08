package com.cafekiosk.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTest {

	  static { 
	        try { 
	            Class.forName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy"); 
	        } catch(Exception e) { 
	            e.printStackTrace(); 
	        } 
	    } 
	    
	    @Test 
	    public void testConnection() { 
	        try(Connection con = DriverManager.getConnection( 
	                "jdbc:log4jdbc:mysql://183.111.199.217/hello4018?serverTimezone=Asia/Seoul", 
	                "hello4018", 
	                "q1w2e3r4++")){ 
	            System.out.println(con); 
	            System.out.println("hi"); 
	        } catch (Exception e) { 
	            fail(e.getMessage()); 
	        } 
	    
	    } 
}
