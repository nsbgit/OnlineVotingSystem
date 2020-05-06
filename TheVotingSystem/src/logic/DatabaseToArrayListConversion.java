package logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DatabaseToArrayListConversion {
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet resultSet;
	private int countColumn;
	private ArrayList arrayList;
	private String[] data;
	private String temp;

	public ArrayList convertToArrayList(String sql) {
		try {
			connection = DatabaseConnectionOpen.createConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			countColumn = resultSet.getMetaData().getColumnCount();
			arrayList = new ArrayList();
			
			while (resultSet.next()) {
				data = new String[countColumn];
				
				for (int i = 0; i < countColumn; i++) {
					data[i] = resultSet.getString(i+1);
				}
				arrayList.add(data);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return arrayList;
	}
	
	
	
	public ArrayList convertToArrayListBySession(String sql, String sessionId) {
		try {
			connection = DatabaseConnectionOpen.createConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			countColumn = resultSet.getMetaData().getColumnCount();
			arrayList = new ArrayList();
			
			while (resultSet.next()) {
				temp = resultSet.getString(1);
				if (temp.equals(sessionId)) {
					data = new String[countColumn-1];
					
					for (int i = 0; i < countColumn-1; i++) {
						data[i] = resultSet.getString(i+2);
					}
					arrayList.add(data);
					break;
				} 
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return arrayList;
	}
}
