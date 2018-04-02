package OperationTheater;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.conn.MyCon;

public class OperationDao {
	public int OperationReg(OperationRegistrationBean registrationBean) {
		String sql = "insert into operation_patient values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = MyCon.getConnection().prepareStatement(sql);
			ps.setInt(1, registrationBean.getId());
			ps.setString(2, registrationBean.getOp_date());
			ps.setString(3, registrationBean.getOp_time());
			ps.setString(4, registrationBean.getOp_type());
			ps.setString(5, registrationBean.getOp_name());
			ps.setInt(6, registrationBean.getPatient_id());
			ps.setInt(7, registrationBean.getTotal_cost());
			ps.setInt(8, registrationBean.getPaid_cost());
			ps.setString(9, registrationBean.getSurgeon_name());
			ps.setString(10, registrationBean.getAsurgeon_name());
			ps.setString(11, registrationBean.getNurse_name());
			ps.setString(12, registrationBean.getOt_boy_name());
			ps.setString(13, registrationBean.getOp_theater());
			return ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

	public int updateOperationDetail(OperationRegistrationBean registrationBean) {

		String sql = "update operation_patient set operation_date=?,operation_time=?" +
				",operation_type=?,operation_name=?,patient_id=?,operation_cost=?" +
				",paid_operation_cost=?,surgeon_name=?,assistant_surgeon_name=?" +
				",nurse_Name=?,ot_boy_name=?,operation_theater=? where operation_id=?";
		try {
			PreparedStatement ps = MyCon.getConnection().prepareStatement(sql);

			ps.setString(1, registrationBean.getOp_date());
			ps.setString(2, registrationBean.getOp_time());
			ps.setString(3, registrationBean.getOp_type());
			ps.setString(4, registrationBean.getOp_name());
			ps.setInt(5, registrationBean.getPatient_id());
			ps.setInt(6, registrationBean.getTotal_cost());
			ps.setInt(7, registrationBean.getPaid_cost());
			ps.setString(8, registrationBean.getSurgeon_name());
			ps.setString(9, registrationBean.getAsurgeon_name());
			ps.setString(10, registrationBean.getNurse_name());
			ps.setString(11, registrationBean.getOt_boy_name());
			ps.setString(12, registrationBean.getOp_theater());
			ps.setInt(13, registrationBean.getId());
			return ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

}
